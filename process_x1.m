function [h11, h21] = process_x1(x1, y1, y2, pulseWidth)
    % Process the training data to characterize the channel associated
    % with the data sent from channel 2.
    % Input Parameters:
    % x1         : The data sent from antenna 1 (used to isolate training
    %              signal for comparison).
    % y1         : The data received on antenna 1.
    % y2         : The data received on antenna 2.
    % pulseWidth : The width of each data bit.
    % Returns:
    % h11        : Channel characterization for information received by 
    %              antenna 1 sent from antenna 1.
    % h21        : Channel characterization for information received by 
    %              antenna 2 sent from antenna 1.
    x1_train = x1(5001: 5001 + 128*pulseWidth -1);
    y1_x1_train = y1(5001:5001 + 128*pulseWidth -1);
    h11 = mean(y1_x1_train./x1_train);
    y2_x1_train = y2(5001: 5001 + 128*pulseWidth -1);
    h21 = mean(y2_x1_train./x1_train);
end

