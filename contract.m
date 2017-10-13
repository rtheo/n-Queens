function ss = contract( dim )
k = kernel( dim ); d2 = dim^2;
n=d2;m = floor( n/2 );flag = mod(d2, 2); % perform 4-folding operation on kernel matrix
if flag, step = 2; else step = 1; end
kk=k(1:m,1:m) + flipud(k(m+step:n,1:m)) + fliplr(k(1:m,m+step:n)) + flipud(fliplr(k(m+step:n,m+step:n)));
if flag, 
    kk = [kk, k(1:m, m+1) + flipud( k(m+2:n, m+1) ) ]; 
    kk = [kk; k(m+1, 1:m+1) + fliplr( k(m+1, m+1:n) ) ]; 
end 
kk = 1- (kk > 0 ); ss=sum(kk(:));
[r, c] = find( kk ); rc = [r'; c']; % extract row-col. indices

end