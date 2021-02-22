function [y1, y2] = correct_lag(x1, x2, y1, y2)
    % Account for the fact that the signal received at y1 and y2 is lagging
    % behind those in x1 and x2 because of a time delay. The correction is
    % done using the cross correlation.
    % Input Parameters:
    % x1            : The signal sent from Tx1
    % x2            : The signal sent from Tx2
    % Returns:
    % y1            : The signal received by Rx1
    % y2            : The signal received by Rx2
    
    % Determine how much y1 is lagging
    [c1, lags1] = xcorr(real(y1), x1);
    [~, I1] = max(abs(c1));
    t_corr1 = lags1(I1);
    
    % Correct lag in y1 and add zeros to the end to account for shortened
    % length
    y1 = [y1(t_corr1:end); zeros(t_corr1-1, 1)];
    
    % Determine how much y2 is lagging
    [c2, lags2] = xcorr(real(y2), x2);
    [~, I2] = max(abs(c2));
    t_corr2 = lags2(I2);
    
    % Correct lag in y2 and add zeros to the end to account for shortened
    % length
    y2 = [y2(t_corr2:end); zeros(t_corr2-1, 1)];
end