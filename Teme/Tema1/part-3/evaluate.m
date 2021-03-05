function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  pathCats = path_to_testset;
  pathNotCats = path_to_testset;
  pathCats = strcat(pathCats,'cats/');
  pathNotCats = strcat(pathNotCats,'not_cats/');
  imagesCats = getImgNames(pathCats);
  imagesNotCats = getImgNames(pathNotCats);
	[nCats dCats] = size(imagesCats);
  [nNoCats dNoCats] = size(imagesNotCats);
  w = w';
  count = 0;
  for i=1:nCats
    img = imagesCats(i, 1:dCats);
    in = strcat(pathCats, img);
    if (strcmp(histogram, "RGB"))
      	x_out = rgbHistogram(in, count_bins);
    else
        x_out = hsvHistogram(in, count_bins);
    endif
        x_out = [x_out 1];

    y = double(w*x_out');
    if (y >= double(0))
      count++;
    endif
  endfor
    for i=1:nNoCats
    img = imagesNotCats(i, 1:dNoCats);
    in = strcat(pathNotCats, img);
    if (strcmp(histogram, "RGB"))
      	x_out = rgbHistogram(in, count_bins);
    else
        x_out = hsvHistogram(in, count_bins);
    endif
    x_out = [x_out 1];
    y = double(w*x_out');
    if (y < double(0))
      count++;
    endif
  endfor
  percentage = double (count/(nCats + nNoCats));
endfunction