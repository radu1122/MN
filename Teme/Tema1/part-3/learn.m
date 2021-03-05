function [w] = learn(X, y)
  NewCol = ones(size(X,1),1);
  X1 = [X NewCol];
  w = SST(X1,y);
end
