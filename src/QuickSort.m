## Copyright (C) 2016 thiago.basso
## 
## Author: thiago <thiago.basso@gmail.com>
## Created: 2016-09-25

function [vetor] = QuickSort (vetor, p, r)
  if p<r
    [vetor,q] = partition(vetor, p, r);
    vetor = QuickSort(vetor, p, q-1);
    vetor = QuickSort(vetor, q+1, r);
  endif
endfunction

function [vetor,q] = partition(vetor, p, r)
  x = vetor(r);
  i = p-1;
  for j=p:r-1
    if vetor(j) <= x
      i = i+1;
      temp = vetor(i);
      vetor(i) = vetor(j);
      vetor(j) = temp;
    endif
  endfor
  temp = vetor(i+1);
  vetor(i+1) = vetor(r);
  vetor(r) = temp;
  q = i+1;
endfunction