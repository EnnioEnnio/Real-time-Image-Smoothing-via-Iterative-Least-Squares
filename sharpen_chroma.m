clear
close all

lambda = 1;
iter = 4;
p = 0.8;
eps = 0.0001; 

% Specify the directory path where the images are located
imageDir = '/Users/ennios/Desktop/MML_Medical_Machine_Learning/endonerf_sample_datasets/cutting_tissues_twice/images/';
targetDir = '/Users/ennios/Desktop/MML_Medical_Machine_Learning/endonerf_sample_datasets/ctt_images_sharpened_chroma_05/images/';

% Iterate over the images and apply the sharpening code
for i = 0:155
    % Generate the file name for the current image
    inputImage = sprintf('%s%06d.png', imageDir, i);
    
    % Load the RGB image
    rgbImage = imread(inputImage);
    rgbImage = im2double(rgbImage);
    
    % Step 1: Convert to intensity using weighting factors
    intensityImage = 0.2989 * rgbImage(:,:,1) + 0.5870 * rgbImage(:,:,2) + 0.1140 * rgbImage(:,:,3);
    intensityImage = im2double(intensityImage);

    % Step 2: Calculate chromaticity
    chromaticityImage = rgbImage ./ intensityImage;

    % Step 3: Apply sharpening on the chromaticity image
    % Apply the sharpening code (ILS_LNorm function)
    Smoothed = ILS_LNorm(chromaticityImage, lambda, p, eps, iter);
    Diff = chromaticityImage - Smoothed;
    sharpenedChromaticityImage = chromaticityImage + 0.5 * Diff;

    % Step 5: Combine intensity and sharpened chromaticity
    finalImageRGB = intensityImage .* sharpenedChromaticityImage;

    % Generate the file name for the sharpened image
    newFilename = sprintf('%s%06d.png', targetDir, i);
    
    % Save the sharpened image
    imwrite(finalImageRGB, newFilename);
    
    % Display a message for each image processed
    disp(['Processed image ' num2str(i) ' out of 155']);
end 