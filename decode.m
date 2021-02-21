function [x1_decoded, x2_decoded] = decode(y, x1_w, x2_w)
    % TODO
    x1_decoded = x1_w'*transpose(y);
    x2_decoded = x2_w'*transpose(y);    
end