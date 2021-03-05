function R = Algebraic(nume, d)
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
  l=sum(A,2);
  K = zeros(N,N);
  K(1:1+size(K,1):end) = l;
  M = (PR_Inv(K)*A)';
  I = eye(N);
  s1 = zeros(N, 1) + 1;
  R = PR_Inv(I - d * M) * (double(double((1-d))/double(N))*s1);
  fclose(fin);
endfunction