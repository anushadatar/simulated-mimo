function [h12, h22] = process_x2(x2, y1, y2, pulseWidth)
    % Process the training data to characterize the channel associated
    % with the data sent from channel 2.
    % Input Parameters:
    % x2         : The data sent from antenna 2 (used to isolate training
    %              signal for comparison).
    % y1         : The data received on antenna 1.
    % y2         : The data received on antenna 2.
    % pulseWidth : The width of each data bit.
    % Returns:
    % h12        : Channel characterization for information received by 
    %              antenna 1 sent from antenna 2.
    % h22        : Channel characterization for information received by 
    %              antenna 2 sent from antenna 2.

    x2_train = x2(10001 + 128*pulseWidth: 10001 + 2*128*pulseWidth-1);
    y1_x2_train = y1(10001 + 128*pulseWidth: 10001 + 2*128*pulseWidth-1);
    
    h12 = mean(y1_x2_train./x2_train);
    
    y2_x2_train = y2(10001 + 128*pulseWidth: 10001 + 2*128*pulseWidth-1);

    h22 = mean(y2_x2_train./x2_train);
end