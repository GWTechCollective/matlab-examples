%%
%   MatLab Image Manipulation Example
%   Mark Tentindo - markten@gwu.edu
%   2015 GWTC Python-MatLab Workshop
%%

clc;
clear all;
close all;
format compact;

%% Define a function to open a file, detect edges, and save the result
function [figHandle] = image_to_grayscale(inputFile, outputFolder)
        image = imread(inputFile);                  % load image file
        image = rgb2gray(image);    % convert image to grayscale
        fig = figure;
        imshow(image);
        [~, fileName, ~] = fileparts(inputFile);
        title(sprintf('Grayscale Version of %s', fileName))
        cd(fullfile(outputFolder))
        saveas(fig, fileName, 'jpg');
        close(fig);
end

%% Config Variables
    % I like to set up a few directories that I can just drop files into and
    % have the code do its thing.I usually leave the folder name at the top of
    % the script so its easy to edit.
        INPUT_DIR = fullfile(pwd, 'raw_images');
        OUTPUT_DIR = fullfile(pwd, 'proc_images');

%% Iterate the Analysis over the Images

    % we use the wildcard "*" operator to select any file with the PNG extension
        images = dir(fullfile(INPUT_DIR, '*.jpg'));

    % Check that we actually have something to process
        if length(images) < 1
            error('!!! No images found in input directory !!!')
        end

    % iterate through all the images performing processing and saving the
    % results in the output folder
        fprintf('Analyzing Files...\n')

        for index = 1:length(images);
            fprintf('\t%s\n', images(index).name)

            inputFile = fullfile(INPUT_DIR, images(index).name);

            image_to_grayscale(inputFile, OUTPUT_DIR);

        end

    fprintf('Analysis Complete.\n')
