function [cd, cv, uidx] = blockanalysis(s, d)
% Maps the bit block structure of binary patterns into a polynomial structure.
% ----------------------------------------------------------------------------------------------------------------
% Returns :
% cv : block counters vector, cd : bit blocks dimension
% d : display block structure graphically
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    if nargin < 2, d=0; end
    if size(s, 1) > 1 && size(s, 2) > 1, error('Only 1D signals allowed in Block Analyzer!'); end
    if size(s,1)>1, s = s';end; scheck = unique( s );
    if ~islogical(s), if sum( floor(s)-s )~=0, error('Non-integer sequence!'), end, end
    if length(scheck)>2 || sum( s > 1) + sum(s < 0 ) > 0, error('Non-binary sequence!'), end
    s = 2*s - 1; % change representation    
    v = abs(diff(s))/2; % edge detection    
    cd = sum(v) + 1;% bit blocks dimension
    % extract block polynomial coefficients
    v = [0, v]; % protect from ptr overflow     
    csum = 0; cdptr = 1;cv = zeros(1, cd);
    for j=1:length(s)
        csum = csum*( 1 - v(j) ) + s(j);
        cdptr = cdptr + v(j);
        cv(cdptr) = csum;        
    end   
    uidx = length( unique( cv ) )/cd;
    if d, bar( cv ), title(['Block Dim.: ', num2str(cd)]), end
end