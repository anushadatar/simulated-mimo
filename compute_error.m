function [err, bits_x, bits_y] = compute_error(decoded_signal, original_signal)
    % Compute the percent difference between the complete original signal
    % and the complete received signal. The complete signal includes the
    % training bits and 5000 bit gaps prior to the actual BPSK data.
    % Input parameters:
    % original_signal : Vector containing original signal to compare
    %                   against.
    % decoded_signal  : Vector containing decoded signal.
    %         
    % Output: 
    % err             : Percent error between transmitted/received
    %                   message.
    dataWidth = 1024;
    pulseWidth = 40;
    headerWidth = 5000;
    trainingBitsWidth = 128;
    trainingWidth = 2*(pulseWidth*trainingBitsWidth + headerWidth) + headerWidth + 1;
    tx_data = original_signal(trainingWidth: trainingWidth + dataWidth*pulseWidth - 1);
    rx_data = decoded_signal(trainingWidth: trainingWidth + dataWidth*pulseWidth - 1);
    
    % Sample data after separating out data bits.
    bits_x = [];
    bits_y = [];
    for i=pulseWidth/2:pulseWidth:length(rx_data)
        bits_x = [bits_x sign(real(tx_data(i)))];
        bits_y = [bits_y sign(real(rx_data(i)))];
    end
    
    % Compute percent difference.
    err = sum((bits_x ~= bits_y)) / length(bits_x);
end