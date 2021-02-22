function [x1_decoded, x2_decoded] = decode_zero_forcing(y, x1_w, x2_w)
    % Decode the signals based on the zero forcing weight matrix,
    % Input Parameters:
    % y             : The received signal in this context.
    % x1_w          : The weight vector associated with x1 in this context.
    % x2_w          : The weight vector associated with x2 in this context.
    % Returns:    
    % x1_decoded    : The decoded x1 signal.
    % x2_decoded    : The decoded x2 signal.

    x1_decoded = x1_w'*transpose(y);
    x2_decoded = x2_w'*transpose(y); 
end