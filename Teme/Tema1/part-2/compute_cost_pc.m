function [cost] = compute_cost_pc(points, centroids)
  cost = 0; 
  dist = 0;
  indices = zeros(size(points,1), 1);
  NC = size(centroids, 1);
  k = 0;
  m = size(points,1);
  for i = 1 : m
    min_dist = 9999;
    for j=1:NC
      dist = norm(points(i,:) - centroids(j,:));
      if(dist <  min_dist)
        min_dist = dist;
        k = j;
      endif
    endfor
    indices(i) = k;
  endfor
  for i = 1 : m
    for j = 1 : NC
      if indices(i) == j
        dist = norm(points(i, :) - centroids(j, :));
        cost = cost + dist;
      endif
    endfor
  endfor
endfunction

