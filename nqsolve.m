function w = nqsolve( d, imin, imax, graf )
% Full n-Queen solver for [imin,...,imax] interval of 1D reduced chessboard
% d --> board dimension
% imin, imax --> min. and max. limits of interger interval (search space)
clc, close all
if nargin<4, graf=0; end
K = kernel( d );
d2 = d^2; n = 1; 
for i=imin:imax
    str = fliplr(de2bi( i, d2 ) );
    flag = ( s*( Kf*s' ) == 0 );
    w( sum(s), n ) = flag; n = n + 1; %classify result with binary digit sum
    if flag 
        if graf, imagesc( 1 - reshape(s, d, d) ), colormap gray, pause(0.1), end 
        disp( ['n-queens: ' num2str( sum(s) ), ', board index: ', num2str(i) ] ) 
    end
end
ws = sum( w, 2 ); w = w( find(ws), : ); % filter out empty rows
figure, bar( ws ), title( ['n-Queen statistics in  [',num2str(imin),'...',num2str(imax) ']'])
xlabel('No. of Queens ' ), ylabel('Neutral Board Configurations')
end
