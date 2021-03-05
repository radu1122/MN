function [sol] = rgbHistogram(path_to_image, count_bins)
  I = imread(path_to_image);
  n = size(I)(1);
  m = size(I)(2);
  sol = zeros(1, count_bins*3);
  R = floor(double(I(:,:,1)) * count_bins / 256) + 1;
  G = floor(double(I(:,:,2)) * count_bins / 256) + 1;
  B = floor(double(I(:,:,3)) * count_bins / 256) + 1;
  [C,ia,ic] = unique(R);
  R1 = accumarray(ic, 1, [1,count_bins]);
 [C,ia,ic] = unique(G);
  G1 = accumarray(ic, 1, [1,count_bins]);
 [C,ia,ic] = unique(B);
  B1 = accumarray(ic, 1, [1,count_bins]);
  sol = [R1, G1, B1];
endfunction
