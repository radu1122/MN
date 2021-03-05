function [sol] = hsvHistogram(path_to_image, count_bins)
  I = imread(path_to_image); 
  [nL, nC, u] = size(I);
  n = size(I, 1);
  m = size(I, 2);
  R = (double(I)/255)(:,:,1);
  G = (double(I)/255)(:,:,2);
  B = (double(I)/255)(:,:,3);
  max1 = max(R, G);
  min1 = min(R,G);
  max = max(max1,B);
  min = min(min1,B);
  V = max;
  S = zeros(n, m);
  S(max>0) = (max(max>0) - min(max>0))./max(max>0);
  H = zeros(n, m);
  H(S==0) = -1;
  d = max - min;
  d(d == 0) = Inf;
  H(R == max) = (G(R == max) - B(R == max))./d(R == max);
  H(G == max) = 2 + (B(G == max) - R(G == max))./d(G == max);
  H(B == max) = 4 + (R(B == max) - G(B == max))./d(B == max);
  H = H*60;
  H(H<0) = H(H<0) + 360;
  H = H ./ 360;
  

  sol = zeros(1, count_bins * 3);
  H1=floor((double(double(H).*count_bins./1.01))).+1;
  S1=floor((double(double(S).*count_bins./1.01))).+1;
  V1=floor((double(double(V).*count_bins./1.01))).+1;
  
  [u,~,j]=unique(H1(:,:));  
  %sol(1,1:count_bins) = accumarray(j'(:),1,[count_bins,1])';
  x=accumarray(j'(:),1,[count_bins,1])';
  for i=1:size(u)(1)
    sol(1,u(i))=x(i);
  endfor
  
  [u,~,j]=unique(S1(:,:));  
  x=accumarray(j'(:),1,[count_bins,1])';
  for i=1:size(u)(1)
    sol(1,u(i) + count_bins)=x(i);
  endfor
  
  [u,~,j]=unique(V1(:,:));  
  %sol(1,1:count_bins) = accumarray(j'(:),1,[count_bins,1])';
  x=accumarray(j'(:),1,[count_bins,1])';
  for i=1:size(u)(1)
    sol(1,u(i) + count_bins*2)=x(i);
  endfor
end

