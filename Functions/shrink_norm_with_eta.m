function shrinked_mat = shrink_norm_with_eta(matrix, eta)

%SHRINK_NORM_WITH_ETA
%element-wise shrinking of a given matrix, need to split it into positive
%and negative parts to avoid complex numbers

shrinked_mat = matrix;

shrinked_mat(matrix>0) = (matrix(matrix>0)).^eta;
shrinked_mat(matrix<0) = -((-matrix(matrix<0)).^eta);

end

