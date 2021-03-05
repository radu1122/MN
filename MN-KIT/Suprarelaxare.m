function x = Suprarelaxare(A, b, x0, w, tol, maxiter)
  [n n] = size(A);
  x = zeros(n, 1);
  
  for iter = 1:maxiter
    for i = 1:n
      suma = A(i, 1:i-1)*x(1:i-1) + A(i, i+1:n)*x0(i+1:n);
      x(i) = (w / A(i, i))*(b(i) - suma) + (1 - w)*x0(i);
    endfor
    
    if (norm(x-x0) < tol)
      break;
    endif
    
    x0 = x;
    if (iter == maxiter)
      disp("Nu converge.");
    endif
  endfor
endfunction
