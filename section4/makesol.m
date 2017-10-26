function s = makesol( s )
L = length(s);
s0=[]; for i=1:L, s0 = [s0, (i-1)*L + s(i)]; end
s = zeros(1, L^2); s( s0 ) = 1;
end