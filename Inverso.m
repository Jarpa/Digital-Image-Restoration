function [imgInverso] = Inverso(I,LEN,PSF)


blurred = imfilter(I, PSF, 'conv', 'circular');

otf = psf2otf(PSF,size(blurred));
for l = 1:size(otf,1)
    for m = 1:size(otf,2)
        if otf (l,m) == 0
            otf(l,m) = LEN;
        end    
            
    end    
end
p = fft2(blurred);
r=p./otf;
imgInverso = ifft2(r);
% for a = 1:size(imgInverso,1)
%     for b = 1:size(imgInverso,2)
%         if imgInverso(a,b)>=1
%             imgInverso = 0.999;
%         end
%         if imgInverso(a,b) <= 0
%             imgInverso(a,b) = 0.001;
%         end    
%     end
% end


