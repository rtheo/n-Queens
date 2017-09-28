function [K, Kc, Kd] = kernel(dim, arith, report)
if nargin<3, report=0; end
if nargin<2, arith=0; end
clc, close all
Kc = []; Kd = Kc; newdim = dim^2;
v = 0:dim-1;m1=v; % pointer masks for diagonals
for i=1:dim-1,m1 = [m1; v-i];end
m2 = dim - abs(m1);
m3 = fliplr(m1);
m4 = fliplr(m2);
for i=1:dim
    for j=1:dim
        wc = zeros(dim, dim); wd = wc;
        wc(i, :) = 1; wc(:, j) = 1;
        wd = diag( ones( m2(i, j), 1 ), m1(i, j) );
        wd = wd + fliplr( diag( ones( m4(i, j), 1), m3(i, j) ) );
        wc(i, j) = 0; wd(i, j) = 0;    
        Kc = [Kc; reshape( wc', 1, newdim )];
        Kd = [Kd; reshape( wd', 1, newdim )];
        K = Kc + Kd;
       % imagesc(1-w), title(['i = ',num2str(i),' j = ',num2str(j)]), colormap gray;pause
    end
end
if arith, 
    K = K*( 2.^( 0:newdim-1 ) )'; 
    Kc = Kc*( 2.^( 0:newdim-1 ) )'; 
    Kd = Kd*( 2.^( 0:newdim-1 ) )';     
end
if report
    spy(K), title('Band structure of kernel matrix')
    xlabel 'Press enter to continue', pause
    [a b] = eig(K);
    figure(1), bar( diag(b) ), title 'Eigenvalue Spectrum for kernel'
    figure(2), imagesc( abs(a) ), title 'Eigenvectors for kernel'    
end
end