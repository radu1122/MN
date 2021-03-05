function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
iter_counter = 0;
iter_error = tol*2;
x_old = zeros(size(G_rowptr')-1,1);
while (iter_error > tol && iter_counter < 1000)
    x_new = c + csr_multiplication(G_values, G_colind, G_rowptr, x_old);
    % Calculate new iteration error
    iter_error = abs(norm(x_new, 2) - norm(x_old, 2));
    
    % Update ooriculd iterate
    x_old = x_new;
    
    % Update iteration counter
    iter_counter++;
    
end
x = x_new;
endfunction