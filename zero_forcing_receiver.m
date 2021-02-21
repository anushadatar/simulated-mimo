function [x1_err, x2_err, y1, y2, x1, x2] = zero_forcing_receiver(x1, x2, y1, y2, pulseWidth)    
    % TODO
    % rx data is the ys, tx data is the xs, downsampled 

    received_vector = [y1,y2];

    % Process the training signals to get the weight vectors.
    [h11, h21] = process_x1(x1, y1, y2, pulseWidth);
    [h12, h22] = process_x2(x2, y1, y2, pulseWidth);
 
    % Assemble the channel matrix.
    H = [real(h11), real(h12); real(h21), real(h22)];
 
    % the 
    x1_weight_vector = generate_weight_vector(H, [1; 0]);
    x2_weight_vector = generate_weight_vector(H, [0; 1]);
    
    [x1_decoded, x2_decoded] = decode(received_vector, x1_weight_vector, x2_weight_vector);
    
    [x1_err, x1, y1] = compute_error(x1_decoded, x1);
    [x2_err, x2, y2] = compute_error(x2_decoded, x2);

end