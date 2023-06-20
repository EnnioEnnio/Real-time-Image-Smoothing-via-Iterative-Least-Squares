clear
close all

lambda = 1;
iter = 4;
p = 0.8;
eps = 0.0001; 

% Specify the directory path where the images are located
imageDir = '/Users/ennios/Desktop/MML_Medical_Machine_Learning/endonerf_sample_datasets/cutting_tissues_twice/images_right/';
targetDir = '/Users/ennios/Desktop/MML_Medical_Machine_Learning/Images_ILS_Sharpened/images_right/'

% Iterate over the images and apply the sharpening code
for i = 0:155
    % Generate the file name for the current image
    filename = sprintf('%s%06d.png', imageDir, i);
    
    % Read the image
    Img = im2double(imread(filename));
    
    % Apply the sharpening code (ILS_LNorm function)
    Smoothed = ILS_LNorm(Img, lambda, p, eps, iter);
    Diff = Img - Smoothed;
    ImgE = Img + Diff;
    
    % Generate the file name for the sharpened image
    newFilename = sprintf('%s%06d.png', targetDir, i);
    
    % Save the sharpened image
    imwrite(ImgE, newFilename);
    
    % Display a message for each image processed
    disp(['Processed image ' num2str(i) ' out of 155']);
end
