# Real-time Image Smoothing via Iterative Least Squares
 This is the released code for the following paper accepted to ACM Transactions on Graphics, presented at SIGGRAPH 2020
 
 *"Real-time Image Smoothing via Iterative Least Squares"*. Wei Liu, Pingping Zhang, Xiaolin Huang, Jie Yang, Chunhua Shen, Ian Reid. ACM Transactions on Graphics (TOG), 39(3), 1-24.
 
 **Requirements：**
 CUDA library is required if running with the GPU version.
 
 **Usage:**
 The `Test.m` manuscript provides examples of the usage. 
This script iterates over a hardcoded range of images (dataset dependend, 
in the case of cutting tissues twice from 0 to 155) and applies a 
sharpening algorithm to each image. The script initializes parameters like 
`lambda`, `iter`, `p`, and `eps`, specifies the directory paths for input 
and output, and processes each image in the range using the `ILS_LNorm` 
function. The processed images are saved in the specified target directory.

In addition, the `sharpen_chroma.m` script demonstrates how to apply 
sharpening to the chroma channel of an image. This script follows a 
similar structure to `Test.m`, but includes additional steps to separate 
the intensity and chromaticity components of the image, apply sharpening 
to the chromaticity component, and then combine them back to create a 
final RGB image. However, it is noted that the script currently lacks a 
clamping step after combining the intensity and sharpened chromaticity 
images, which can lead to incorrect values after converting back to RGB 
in some cases. Adding a clamping step to ensure the RGB values are within 
a valid range before saving the final image is recommended.

 
 ---------------------------------
 **Related Work:**
 1. *"Semi-global weighted least squares in image filtering.", Wei Liu, Xiaogang Chen, Chuanhua Shen, Zhi Liu, and Jie Yang. In ICCV 2017.* [Code](https://github.com/wliusjtu/Semi-Global-Weighted-Least-Squares-in-Image-Filtering)
 2. *"Embedding bilateral filter in least squares for efficient edge-preserving image smoothing." Wei Liu, Pingping Zhang, Xiaogang Chen, Chunhua Shen, Xiaolin Huang, Jie Yang. IEEE Transactions on Circuits and Systems for Video Technology (2018).* [Code](https://github.com/wliusjtu/Embedding-Bilateral-Filter-in-Least-Squares-for-Efficient-Edge-preserving-Image-Smoothing)
 3. *"A generalized framework for edge-preserving and structure-preserving image smoothing." Wei Liu, Pingping Zhang, Yinjie Lei, Xiaolin Huang, Jie Yang, and Michael Ng. IEEE Transactions on Transactions on Pattern Analysis and Machine Intelligence (2021).* [Code](https://github.com/wliusjtu/Generalized-Smoothing-Framework)
