function [X, Y] = preprocess(path_to_dataset, histogram, count_bins)
  pathCats = path_to_dataset;
  pathNotCats = path_to_dataset;
  pathCats = strcat(pathCats,'cats/');
  pathNotCats = strcat(pathNotCats,'not_cats/');
  imagesCats = getImgNames(pathCats);
  imagesNotCats = getImgNames(pathNotCats);
	[nCats dCats] = size(imagesCats);
  [nNoCats dNoCats] = size(imagesNotCats);
  nCats = nCats / 2;
  nNoCats = nNoCats / 2;
  X = zeros(nCats + nNoCats, count_bins*3);
  Y = zeros(nCats + nNoCats, 1);
  for i=1:nCats
    img = imagesCats(i, 1:dCats);
    in = strcat(pathCats, img);
    if (strcmp(histogram, "RGB"))
      	x_out = rgbHistogram(in, count_bins);
    endif
    if (strcmp(histogram, "HSV"))    
        x_out = hsvHistogram(in, count_bins);
    endif
    X(i, :) = x_out;
    Y(i,1) = 1;
  endfor
  for i=1:nNoCats
    img = imagesNotCats(i, 1:dNoCats);
    in = strcat(pathNotCats, img);
    if (strcmp(histogram, "RGB"))
      	x_out = rgbHistogram(in, count_bins);
    endif
    if (strcmp(histogram, "HSV"))    
        x_out = hsvHistogram(in, count_bins);
    endif
    X(i + nCats, :) = x_out;
    Y(i + nCats, 1) = -1;
  endfor
endfunction
