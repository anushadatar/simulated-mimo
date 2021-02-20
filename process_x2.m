function [h12, h22] = process_x2(x2, y1, y2, pulseWidth)
% TODO

    x2_train = x2(10001 + 128*pulseWidth: 10001 + 2*128*pulseWidth-1);
    y1_x2_train = y1(10001 + 128*pulseWidth: 10001 + 2*128*pulseWidth-1);
    
    h12 = mean(y1_x2_train./x2_train);
    
    y2_x2_train = y2(10001 + 128*pulseWidth: 10001 + 2*128*pulseWidth-1);

    h22 = mean(y2_x2_train./x2_train);
end