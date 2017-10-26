function [list0, list] = mat2seq( m )
L2 = size(m ,1);
[r, c] = find( m );
list0 = [r';c'];
xp = floor( log2( L2 ) ) + 1;
list = c + r*(2^xp); 
end