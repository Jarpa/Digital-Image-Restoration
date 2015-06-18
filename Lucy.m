function [luc1] = Lucy(blurred,PSF,NUMIT)
% Restaurar la imagen


luc1 = deconvlucy(blurred,PSF,NUMIT);
