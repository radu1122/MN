function [R, N, val1, val2] = Iterative(nume, d, eps)
  fin = fopen(nume, 'r');
  N = fscanf(fin,"%d\n", [1 1]);
  A = zeros(N, N);
  for i=1:N
    line = fgetl(fin);
    buff = sscanf(line, "%f");
    l = buff(1);
    buff = buff(3:end);
    A(l, buff) = 1;
    A(1:1+size(A,1):end) = 0;
  endfor
  val1 = fscanf(fin,"%f\n", [1 1]);
  val2 = fscanf(fin,"%f\n", [1 1]);
  l=sum(A,2);
  K = zeros(N,N);
  K(1:1+size(K,1):end) = l;
  K = K ^-1;
  M = (K*A)';
  PR = double((zeros(N, 1) + 1) / N);
  oldPR = PR;
  s1 = zeros(N, 1) + 1;
  while 1
    PR = double(d * M * oldPR) + (double(double((1-d))/double(N)) * s1);
    if norm(oldPR - PR) <= eps
      break;
    endif
    oldPR = PR;
  endwhile
  R = oldPR;
  fclose(fin);
endfunction