clear all
close all
clc
I = imread('moon.tif');
%I = rgb2gray(I);
img = I;

pathname = 'C:\Users\pcinacap\Desktop\programa\imagenes\diskBlurred/';
pathname2 = 'C:\Users\pcinacap\Desktop\programa\imagenes\restInverso/';
pathname3 = 'C:\Users\pcinacap\Desktop\programa\imagenes\restWiener/';
pathname4 = 'C:\Users\pcinacap\Desktop\programa\imagenes\restLucy/';

mkdir(pathname);
mkdir(pathname2);
mkdir(pathname3);
mkdir(pathname4);
k=1;

for i=2:1:15
    for j=1:4    
    LEN = i;
    THETA = (j -1 ) * 45;
    PSF = fspecial('motion', LEN, THETA);
    blurred = imfilter(I, PSF, 'conv', 'circular');        
    [wnr1] = Wiener(blurred,PSF);
    [luc1] = Lucy(blurred,PSF,100);
    [imgInverso] = Inverso(blurred,LEN,PSF);
    imwrite(blurred,[pathname, 'MotionBlurred',strcat(num2str(k), '-', num2str(j)),'.tif']);
    imwrite(wnr1,[pathname3, 'Wiener',strcat(num2str(k), '-', num2str(j)),'.tif']);
    imwrite(luc1,[pathname4, 'Lucy',strcat(num2str(k), '-', num2str(j)),'.tif']);
    imwrite(imgInverso,[pathname2, 'Inverso',strcat(num2str(k), '-', num2str(j)),'.tif']);
        
    quality1 = imageQualityIndex(double(I), double(blurred));
    quality2 = imageQualityIndex(double(I), double(wnr1));
    quality3 = imageQualityIndex(double(I), double(luc1));
    quality4 = imageQualityIndex(double(I), double(imgInverso));
        
    Emb(k,1) = quality1;
    ResWnr(k,1) = quality2;
    ResLucy(k,1) = quality3;
    ResInv(k,1) = quality4;
    end
    k=k+1;
end
