%%
%   Mark Tentindo
%   markten@gwu.edu
%   GWTC MATLAB Workshop
%

% cleanup and format
    clc                 % this clears the command window
    clear all           % this clears all variable values
    close all           % this closes all figure windows
    format compact      % this reduces the amount of space output takes up on the screen
    format shortEng     % this output numbers in scientific notation

% Configuration
    N = logspace(1, 8, 20);         % create a vector of logarithmically space values (1e1 to 1e8)
    N = round(N);                   % we only want integer values
    times = zeros(length(N), 2);    % allocate vector to store run times
    mems = zeros(length(N), 1);     % allocate vector to store memory usage

% Calculation
    for n = 1:length(N)

        % Pre Allocate Memory
            Y = zeros(N(n), 1);           % allocate vector to store result
            X = randi(1e10, N(n), 1);     % generate random X vector

        % Vector Operation
            tic
                Y = X .* X;
            times(n, 1) = toc;

        % For Loop
            tic
                for index = 1:length(X)
                    Y(index) = X(index) .* X(index);
                end
            times(n, 2) = toc;
    
        % Store memory usage
            mem = memory;
            mems(n) = mem.MemUsedMATLAB;
    
    end

%% Plot Results

    figure; subplot(1, 2, 1)
        semilogx(N, times(:,1), N, times(:,2))
        title('Calculation Times - Linear')
        xlabel('Length of Vector'), ylabel('Time [s]')
        legend('Vector Op', 'Loop')

    subplot(1, 2, 2)
        loglog(N, times(:,1), N, times(:,2))
        title('Calculation Times - Logarithmic')
        xlabel('Length of Vector'), ylabel('Time [s]')
        legend('Vector Op', 'Loop')

    figure
        plot(N, mems./1e9)
        title('Memory Usage')
        xlabel('Length of Vector'), ylabel('Memory Usage [GB]')
