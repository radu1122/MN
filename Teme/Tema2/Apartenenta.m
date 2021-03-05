function y = Apartenenta(x, val1, val2)
  a = double(1 / (val2 - val1));
  b = -double(val1 / (val2 - val1));
	if (double(x) < double(val1))
      y = 0;
      return;
  endif
  if (double(x) >= double(val1) && double(x) <= double(val2))
      y = a * x + b;
      return;
  endif
  y = 1;
  return;
