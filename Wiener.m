function [wnr1] = Wiener(blurred,PSF)
wnr1 = deconvwnr(blurred,PSF);

