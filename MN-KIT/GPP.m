function [A b] = GPP(A, b)
  [n n] = size(A);
  
  for p = 1:n-1
    pivot = -inf;
    linie_pivot = -1;
    
    %calc max dintre el de sub diag, coloana p
    for i = p:n
      if (pivot < abs(A(i, p)))
        pivot = abs(A(i, p));
        linie_pivot = i;
      endif
    endfor
    
    %permutare liniilor linie_pivot si p
    if (p ~= linie_pivot)
      for j = p:n
        aux = A(p, j);
        A(p, j) = A(linie_pivot, j);
        A(linie_pivot, j) = aux;
      endfor
      
      aux = b(p);
      b(p) = b(linie_pivot);
      b(linie_pivot) = aux;
    endif
    
    %eliminare gaussiana; de aici e identic cu alg G
    for i = p+1:n
      if (A(p, p) == 0)
        continue;
      endif
      
      tp = A(i, p) / A(p, p);
      A(i, p) = 0;
      for j = p+1:n
        A(i, j) = A(i, j) - tp*A(p, j);
      endfor
    
      b(i) = b(i) - tp*b(p);
    endfor
  endfor
endfunction
