function w = nqsolve( d, imin, imax )
% Full n-Queen solver for [imin,...,imax] interval of 1D reduced chessboard
% d --> board dimension
% imin, imax --> min. and max. limits of interger interval (search space)
clc, close all
K = kernel( d );
d2 = d^2; n = 1; 
for i=imin:imax
    str = fliplr(dec2bin( i, d2 ) );
    s =[]; for j=1:d2, s = [s, str2num( str( j ) ) ];end
    Ks = repmat(s', 1, 16); Kf = Ks.*K; % componentwise filtering of queens positions!
    flag = ( sum( Kf*s' ) == 0 );
    w( sum(s), n ) = flag; n = n + 1; %classify result with binary digit sum
    if flag 
        imagesc( 1 - reshape(s, 4, 4) ), colormap gray, pause(0.1) 
        disp( ['n-queens: ' num2str( sum(s) ), ', board index: ', num2str(i) ] ) 
    end
end
ws = sum( w, 2 ); w = w( find(ws), : ); % filter out empty rows
figure, bar( ws ), title( ['n-Queen statistics in  [',num2str(imin),'...',num2str(imax) ']'])
xlabel('No. of Queens ' ), ylabel('Neutral Board Configurations')
end