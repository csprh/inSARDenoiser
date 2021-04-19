# inSARDenoising Using 2D Gradient Image
This project (using function denoiseInSar.m) takes an input inteferrogram and converts it to a 2-channel gradient image (using function gradIm2Phase.m)
This image is then denoised and an integferrogram image is recomposed using phase integration (using the function phase2GradIm)
A denoiser has been created (but it's not working at the moment) using DnCNN.
