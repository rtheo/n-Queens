function s = kchoose( n, m)
k = kernel(n);
b = nchoosek( 1:n^2, m );
for i=1:size(b,1)
    res = and( ~k( b(i, 1), :), ~k( b(i, 2), :) );
        for j=3:size(b,2)
            res = and( res, ~k( b(i, j), :) );        
        end
    s(i) = sum( res ); 
end
bar( s ) , title(['Zeros.: ',num2str( sum(s==0) ),' over a total ', num2str(size(b,1))])
end