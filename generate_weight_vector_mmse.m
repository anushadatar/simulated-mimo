function w = generate_weight_vector_mmse(H, one_hot)
    % Generate the weight vector based on the channel (using the mmse
    % receiver).
    % Input Parameters:
    % H       : The aggregated channel parameter matrix.
    % one_hot : The encoding for the specific receiver, with 1; 0
    %           corresponding to receiver one and 0; 1 corresponding to 
    %           receiver two.
    % Returns:
    % w       : Weight vector associated with overall channel
    %           characterization.
    
    % Estimated using var(real(y1(1:5000))).
    var = 0.0255;
    w = inv(H'*H + var*eye(2, 2))*H'*one_hot;
end