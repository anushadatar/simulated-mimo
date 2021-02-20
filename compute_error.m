function err = compute_error(decoded_signal, original_signal)
    % TODO
    % Input: original_signal : Vector containing original signal to compare
    %                          against.
    %        decoded_signal  : Vector containing
    %                          
    % Output: err            : Percent error between transmitted/received
    %                          message
    dataWidth = 1024;
    pulseWidth = 40;
    headerWidth = 5000;
    trainingBitsWidth = 128;
    trainingWidth = 2*(pulseWidth*trainingBitsWidth + headerWidth) + headerWidth + 1;
    tx_data = original_signal(trainingWidth: trainingWidth + dataWidth*pulseWidth - 1);
    rx_data = original_signal(trainingWidth: trainingWidth + dataWidth*pulseWidth - 1);
    err = sum((tx_data ~= rx_data)) / length(tx_data);
end