function s = nqtest( n, m)
k = kernel(n);
b = nchoosek( 1:n^2, m );
for i=1:size(b,1)
    res = and( ~k( b(i, 1), :), ~k( b(i, 2), :) );
    for j=3:size(b,2)
        res = and( res, ~k( b(i, j), :) );        
    end
    ind(i) = comparator( res, b(i, :) );    
    s(i) = sum( res ); 
end
figure, bar(ind)
[c v] =  blockanalysis( ind ); 
figure(2), bar(v)
title(['Block Dimensions (Zeros.: ',num2str( sum(s==0) ),' over a total ', num2str(size(b,1)),')'])
end

function flag = comparator( r, k )
flag = 0;
list = find( r );
c = 0;
for j=1:length(k)
    for i=1:length( list )
        if k(j) == list(i), c=c+1;  end 
    end
end
flag = ( c == length(k) );
end