function [x1_decoded, x2_decoded] = decode(y, w, pulseWidth)
        size(w)
    size(y)
    x1_data = w'*transpose(y);
    
    x1_decoded = x1_data; %(15001 + 2*128*pulseWidth:15001 + 2*128*pulseWidth + 1024*40-1);
    x2_decoded = 0;
end