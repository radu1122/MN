function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  str = strcat(nume,'.out');
  fout = fopen(str,'w');
  [PR1, N, val1, val2] = Iterative(nume, d, eps);
  PR2 = Algebraic(nume, d, eps);
  fprintf(fout,'%d\n\n', N);
  fprintf(fout, '%.6f\n', PR1);
  fprintf(fout, '\n');
  fprintf(fout, '%.6f\n', PR2);
  [B, index] = sort(PR2, 'descend');
  for i=1:N
    fprintf(fout, '\n%d %d %.6f', i, index(i), Apartenenta(B(i), val1, val2));
  endfor
  fclose(fout);
  R1 = PR1;
  R2 = PR2;
endfunction