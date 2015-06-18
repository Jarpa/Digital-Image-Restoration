function [blurred,LEN,PSF] = Emborronamiento(I)

tipos_emborronamiento = {
    'Gaussian',
    'Motion Blur',
    };

tipo = 2;
switch(lower(tipo))
    
    case char(tipos_emborronamiento(1))
        
    case char(tipos_emborronamiento(2))
        LEN = 21;
        THETA = 0;
        PSF = fspecial('motion', LEN, THETA);
        blurred = imfilter(I, PSF, 'conv', 'circular');
end



