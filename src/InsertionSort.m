## Copyright (C) 2016 thiago.basso
## 
## Author: thiago <thiago.basso@gmail.com>
## Created: 2016-09-25

function [vetor] = InsertionSort (vetor)
  for j=2:length(vetor)
    chave = vetor(j);
    %inserir vetor(j) na sequencia ordenada vetor(1..j-1)
    i = j-1;
    while i>0 && vetor(i)>chave
      vetor(i+1) = vetor(i);
      i = i-1;
    endwhile
    vetor(i+1) = chave;
  endfor
endfunction