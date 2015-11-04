%%
%   Mark Tentindo
%   markten@gwu.edu
%   GWTC MATLAB Workshop
%

clc
clear all
close all
format compact

%% Configuration

    d = 0.85;   % a damping factor based on user behavior
    siteNames = {
      'Alpha.com'
      'Bravo.com'
      'Charlie.com'
      'Delta.com'
      'Echo.com'
      'Foxtrot.com'
    };

%% Generate Input
    load('G.mat')
    G = sparse(G);
    
%% Calculation

    R = page_rank(G, d);

%% Results
    
    % bar graph of ranks
        figure
        bar(R)
        title('Ranks of Pages in Network')
        xlabel('Page Index'), ylabel('Page Rank')
    
    % table of results (MATLAB >=2014b only)
        
        % sort the results in descending order
            [R, indices] = sort(R, 'descend');
            R = round(R, 5);
        % make a list of numbers 1 to # of sites
            index = [1:length(G)]';
        % sort the website names
            siteNames = siteNames(indices);
        
        % build the table and set some properties
            rankTable = table(index, R, siteNames);
            rankTable.Properties.Description = 'Page Rankings';
        
        % display the table
            disp(rankTable)
