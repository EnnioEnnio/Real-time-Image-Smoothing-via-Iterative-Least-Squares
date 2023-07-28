clear
close all

lambda = 1;
iter = 4;
p = 0.8;
eps = 0.0001; 

% Specify the directory path where the images are located
imageDir = '/Users/ennios/Desktop/MML_Medical_Machine_Learning/endonerf_sample_datasets/ctt_depth_sharpened/depth_StereoNet_plain/';
targetDir = '/Users/ennios/Desktop/MML_Medical_Machine_Learning/endonerf_sample_datasets/ctt_depth_sharpened/sharpened_depth/ILS(0.5)/StereoNet_plain/';

% Iterate over the images and apply the sharpening code
for i = 0:155
    % Generate the file name for the current image
    filename = sprintf('%sframe-%06d.depth.png', imageDir, i);
    
    % Read the image
    Img = im2double(imread(filename));
    
    % Apply the sharpening code (ILS_LNorm function)
    Smoothed = ILS_LNorm(Img, lambda, p, eps, iter);
    Diff = Img - Smoothed;
    ImgE = Img + 0.5 * Diff;
    
    % Generate the file name for the sharpened image
    newFilename = sprintf('%sframe-%06d.depth.png', targetDir, i);
    
    % Save the sharpened image
    imwrite(ImgE, newFilename);
    
    % Display a message for each image processed
    disp(['Processed image ' num2str(i) ' out of 155']);
end
