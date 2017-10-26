function [Per c] = permat( L )
 p=diag(ones(L-1,1), -1);p(1,L)=1;
 Per = zeros( L^2 );
 for i=1:L, idx = (i-1)*L+1:i*L; Per( idx, idx ) = p; end
 c = zeros(L^2); for i=1:L-1, c = c + Per^i; end
end