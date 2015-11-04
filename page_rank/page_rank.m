%%
%   Mark Tentindo
%   markten@gwu.edu
%   GWTC MATLAB Workshop
%

function [R] = page_rank(G, d)

    % find the number of sites
        N = length(G);
    % find the total number of links on each page
        c = sum(full(G));   
    % find all non-zero values in matrix c
        k = find(c ~= 0);
    % create a weigting matrix based on the number of links on each page
        D = sparse(k, k, 1./c(k), N, N);    
    
    % create a sparse identity matrix
        I = speye(N);
    % create a column vector of ones
        e = ones(N, 1);
    
    % solve for the page ranks
        R = (I - d * G * D)\e;
        R = R/sum(R);

end
