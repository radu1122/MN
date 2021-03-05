function [centroids] = clustering_pc(points, NC)
  centroids = zeros(NC, size(points, 2));
  for i = 1 : NC
    indexes = [i : NC : size(points, 1)];
    centroids(i, :) = sum(points(indexes, :)) / size(indexes, 2);
  endfor
  error = 1;
  itr = 0;
  maxItr = 5000;
  while (error != 0 && itr <=maxItr)
    [new_centroids, new_centroids_size] = compute_centr(points, centroids, NC);
    
    [error, centroids] = final_compute(centroids, new_centroids, new_centroids_size, NC);
    itr++;
  endwhile
endfunction

function [err, centroids] = final_compute(centroids, new_centr, new_centr_size, NC)
    for i = 1:NC
        if new_centr_size(i) ~= 0
          new_centr(i, :) = new_centr(i, :) ./ new_centr_size(i);
        endif
    endfor
    err = sum(abs(centroids - new_centr)(:));
    centroids = new_centr;
endfunction

function [new_centr, new_centr_size] = compute_centr(points, centroids, NC)
    new_centr = zeros(NC, size(points, 2));
    new_centr_size = zeros(NC, 1);
    sizePoints = size(points);
    for i = 1 : sizePoints
      buff = (centroids - points(i, :)) .^ 2;
      distance = sum(buff, 2);
      index = find(distance == min(distance));
      new_centr(index, :) = new_centr(index, :) + points(i, :);
      new_centr_size(index)++;
    endfor
endfunction
