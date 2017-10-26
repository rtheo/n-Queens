function [kk, kf] = kreduce( dim )
[p c] = permat( dim );
kk = kernel( dim ) - c;
figure(1), imagesc(1-kk), colormap gray 
h = hadamard( dim^2 );kf = h*((2*kk-1)*h);
figure(2), imagesc( kf == 0 ), %colormap gray
end