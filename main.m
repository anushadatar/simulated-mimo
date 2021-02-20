function [err, x_bits, y_bits] = main(x1, x2, y1, y2, pulseWidth)
    
    y = [y1,y2];

    [h11, h21] = process_x1(x1, y1, y2, pulseWidth);
    [h12, h22] = process_x2(x2, y1, y2, pulseWidth);
    
    H = [real(h11), real(h12); real(h21), real(h22)];
    
    w = generate_weight_vector(H, [1; 0]);
    
    [x1_decoded, x2_decoded] = decode(y, w, pulseWidth);
    
    [err, x_bits, y_bits] = compute_error(x1_decoded, x1);

end