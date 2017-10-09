function [vetor_ordenado] = MergeSort(vetor_desordenado,n)

  if n==1
    vetor_ordenado = vetor_desordenado;
  else
    m = floor(n/2); % floor arredonda para o inteiro menor
    % Divide o vetor_desordenado em duas partes
    vetor_esq = MergeSort(vetor_desordenado(1:m),m); % Primeira parte vetor_esq 
    vetor_dir = MergeSort(vetor_desordenado(m+1:n),n-m); % Segunda parte vetor_dir
    vetor_ordenado = Merge(vetor_esq,m,vetor_dir,n-m); % Merge das duas partes
  end
end

function [subvetor_ordenado] = Merge(vetor_esq,n,vetor_dir,m)
  subvetor_ordenado = zeros(1,n+m);
  i_vetor_esq = 1; % Índice do próximo valor do vetor_esq a ser selecionado.
  i_vetor_dir = 1; % Índice do próximo valor do vetor_dir a ser selecionado.
  for i=1:(n+m)
    if i_vetor_esq > n % Quando terminar o vetor_esq 
      subvetor_ordenado(i) = vetor_dir(i_vetor_dir); % Completa o subvetor_ordenado com os valores do vetor_dir
      i_vetor_dir++;
    elseif i_vetor_dir > m % Quando terminar o vetor_dir
        subvetor_ordenado(i) = vetor_esq(i_vetor_esq); % Completa o subvetor_ordenado com os valores do vetor_esq
        i_vetor_esq++;
    elseif vetor_esq(i_vetor_esq) <= vetor_dir(i_vetor_dir) % Comparação para descobrir o menor valor
        subvetor_ordenado(i) = vetor_esq(i_vetor_esq); % Insere o valor do vetor_esq na posição i_vetor_esq no subvetor_ordenado
        i_vetor_esq++;
    else
      subvetor_ordenado(i) = vetor_dir(i_vetor_dir); % Insere o valor do vetor_dir na posição i_vetor_dir no subvetor_ordenado
      i_vetor_dir++;
    end
  end
end
