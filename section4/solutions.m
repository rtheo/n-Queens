function [s w seq] = solutions( n, choice )
if nargin<2, choice=0; end
switch n
    case 4, 
        s = [3 1 4 2]; 
    case 5,
        s = [4, 2, 5, 3, 1];
    case 6,
        s = [5 3 1 6 4 2];
    case 7,
        s = [6 4 2 7 5 3 1];
    case 8,
        s = [4 2 7 3 6 8 5 1];
    case 9,
        s = [5 7 9 4 2 8 6 3 1];
    case 10,
        s = [7 4 2 9 5 10 8 6 3 1];
end
s = makesol( s );w = s'*s; seq=[];
if choice > 0
    [a b] = mat2seq( w );
    switch choice
        case 1, seq = a; x = 1:size(a, 2); plot(x, a(1,:), x ,a(2,:))
        case 2, seq = b; plot(b),hold on, plot(b,'.r'), hold off
    end
end
end