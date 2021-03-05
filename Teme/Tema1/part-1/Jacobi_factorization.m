function [G_J, c_J] = Jacobi_factorization(A, b)
  D = diag(diag(A));
  I = eye(size(A,1));
  D1 = inv(D);
  G_J = I - D1*A;
  c_J = D1*b;
endfunction
