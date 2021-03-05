function [A, b] = generate_probabilities_system(rows)
  n = (rows*(rows+1))/2;
  A = zeros(n, n);
  b = zeros(n, 1);
  A(1,1) = 4;
  A(1,2) = -1;
  A(1,3) = -1;
  l = 2;
  x = 0;
  for i = 2:n
    z = 2;
    if (n >= i+1 && x != l-1) z++; A(i,i+1) = -1; endif
    if (n >= i + l) z++; A(i,i+l) = -1; endif
    if (n >= i + l + 1) z++; A(i,i+l+1) = -1; endif
    if (x > 0) z++; A(i, i-1) = -1; endif;
    if (x == 0) A(i, i-l+1) = -1; endif;
    if (x == l-1) A(i, i-l) = -1; endif;
    if (n < i - x + l) z++; b(i,1) = 1; endif;
    if (x != 0 && x != l-1) A(i, i-l) = -1; A(i, i-l+1) = -1; endif;
    A(i,i) = z;
    if (x == l-1) x = 0; l++; else x++; endif;
  endfor
endfunction