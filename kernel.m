function [K0, K1] = kernel(dim, report)
if nargin<2, report=0; end
clc, close all
K0 = [];newdim = dim^2;
v = 0:dim-1;m1=v; % pointer masks for diagonals
for i=1:dim-1,m1 = [m1; v-i];end
m2 = dim - abs(m1);
m3 = fliplr(m1);
m4 = fliplr(m2);%k=0;
for i=1:dim
    for j=1:dim
        w = zeros(dim, dim); 
        w(i, :) = 1; w(:, j) = 1;
        w = w + diag( ones( m2(i, j), 1 ), m1(i, j) );
        w = w + fliplr( diag( ones( m4(i, j), 1), m3(i, j) ) );
        w(i, j) = 0;        
        K0 = [K0; reshape( w', 1, newdim )];
       % imagesc(1-w), title(['i = ',num2str(i),' j = ',num2str(j)]), colormap gray;pause
    end
end
if report
spy(K0), title('Band structure of kernel matrix')
xlabel 'Press enter to continue', pause
[a b] = eig(K0);
figure(1), bar( diag(b) ), title 'Eigenvalue Spectrum for reduced kernel'
figure(2), imagesc( abs(a) ), title 'Eigenvectors for reduced kernel'
xlabel 'Press enter to continue', pause
K1 = K0 + eye(newdim);
[a b] = eig(K1);
figure(1), bar( diag(b) ), title 'Eigenvalue Spectrum for full kernel'
figure(2), imagesc( abs(a) ), title 'Eigenvectors for full kernel'
end
end
