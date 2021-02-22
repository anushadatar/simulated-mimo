function [x1_err, x2_err, y1, y2, x1, x2] = zero_forcing_receiver(x1, x2, y1, y2, pulseWidth)    
    % Main function associated with decoding provided dataset using the
    % zero forcing receiver.
    % Input Parameters:
    % x1         : The transmitted x1 signal.
    % x2         : The transmitted x2 singal.
    % y1         : The received y1 signal.
    % y2         : The received y2 signal.
    % pulseWidth : The width of the pulse for each data bit.
    % Returns:    
    % x1_err     : The error associated with the x1 signal.
    % x2_err     : The error associated with the x2 signal.
    % y1         : The downsampled and cropped y1 data signal.
    % y2         : The downsampled and cropped y2 data signal.
    % x1         : The downsampled and cropped x1 data signal.
    % x2         : The downsampled and cropped x2 data signal.      
    
    y1 = real(y1);
    y2 = real(y2);
    
    [y1, y2] = correct_lag(x1, x2, y1, y2);
    
    % Construct vector of received data.
    received_vector = [y1, y2];

    % Process the training signals to get the weight vectors.
    [h11, h21] = process_x1(x1, y1, y2, pulseWidth);
    [h12, h22] = process_x2(x2, y1, y2, pulseWidth);
 
    % Assemble the channel matrix.
    H = [h11, h12; h21, h22];
 
    % Generate weight vectors  using ZF methods.
    x1_weight_vector = generate_weight_vector_zf(H, [1; 0]);
    x2_weight_vector = generate_weight_vector_zf(H, [0; 1]);
    
    % Decode the signal based on the weight vectors.
    [x1_decoded, x2_decoded] = decode_zero_forcing(received_vector, x1_weight_vector, x2_weight_vector);
    
    % Compute overall error.
    [x1_err, x1, y1] = compute_error(x1_decoded, x1);
    [x2_err, x2, y2] = compute_error(x2_decoded, x2);

end