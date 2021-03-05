function [values, colind, rowptr] = matrix_to_csr(A)
  [colind, j, values] = find(A');
   rowptr = cumsum([1 ; accumarray(j, 1)]);
   rowptr = rowptr';
   colind = colind';
   values = values';
endfunction