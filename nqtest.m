function s = nqtest( n, m, usage)
if nargin<3, usage = 0; end
k = kernel(n);flag = 0;
b = nchoosek( 1:n^2, m );
for i=1:size(b,1)
    res = and( ~k( b(i, 1), :), ~k( b(i, 2), :) );
    for j=3:size(b,2)
        res = and( res, ~k( b(i, j), :) );        
    end
    ind(i) = ~isempty( intersect( find( res), b(i, :) ) );    
    if usage && ind(i), flag = 1; break; end
    s(i) = sum( res ); 
end
if flag, 
    disp('Lo! Take the money and run!'),
else
    disp('Life sucks and then you die!'), 
end
if ~usage && any( ind ) 
    figure, bar(ind)
    [c v] =  blockanalysis( ind ); 
    figure(2), bar(v)
    title(['Block Dimensions (Zeros.: ',num2str( sum(s==0) ),' over a total ', num2str(size(b,1)),')'])   
end
end