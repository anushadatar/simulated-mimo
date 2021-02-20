function w = generate_weight_vector(H, one_hot)
    %TODO
    
    w = inv(H')*one_hot;
end