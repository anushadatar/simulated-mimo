function w = generate_weight_vector(H, one_hot)
    % Generate the weight vector based on the channel.
    % Input Parameters:
    % H       : The aggregated channel parameter matrix.
    % one_hot : The encoding for the specific receiver, with 1; 0
    %           corresponding to receiver one and 0; 1 corresponding to 
    %           receiver two.
    % Returns:
    % w       : Weight vector associated with overall channel
    %           characterization.
    
    w = inv(H')*one_hot;
end