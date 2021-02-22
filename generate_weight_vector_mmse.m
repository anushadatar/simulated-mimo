function [w1, w2] = generate_weight_vector_mmse(H)
    % Generate the weight vector based on the channel (using the mmse
    % receiver).
    % Input Parameters:
    % H       : The aggregated channel parameter matrix.
    % Returns:
    % w1       : Weight vector used to retrieve x1
    % w2       : Weight vector used to retrieve x2
    
    % Estimated using var(real(y1(1:5000))).
    var = 0.0255;
    w = inv(H'*H + var.*eye(2, 2))*H';
    w1 = w(1, :);
    w2 = w(2, :);
end