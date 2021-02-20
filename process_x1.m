function [h11, h21] = process_x1(x1, y1, y2, pulseWidth)
% TODO

    x1_train = x1(5001: 5001 + 128*pulseWidth -1);
    y1_x1_train = y1(5001:5001 + 128*pulseWidth -1);
    
    h11 = mean(y1_x1_train./x1_train);
    
    y2_x1_train = y2(5001: 5001 + 128*pulseWidth -1);

    h21 = mean(y2_x1_train./x1_train);
end

