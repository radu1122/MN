function [x] = SST(A, b)
  [Q, R] = Householder(A);
  x = R\Q.'*b;
end