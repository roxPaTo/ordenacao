max_recursion_depth(1000) % altera o tamanho permitido de recusõe

k=1;
for n=[5 100 250 500 800 1000]
  fprintf('\n Executando a ordenacao de %i elementos(aperte qualquer tecla para continuar)...\n\n', n);
  %pause;
  
  vetorMelhorCaso = [1:n];
  vetorMedioCaso = randperm(n);
  vetorPiorCaso = [n:-1:1];
  
  fprintf('===InsertionSort===\n');
  t1 = tic;
  InsertionSort(vetorMelhorCaso);
  tempoExecucaoMelhorCaso = toc(t1);
  fprintf('Melhor Caso => %ds \n', tempoExecucaoMelhorCaso);
  
  t1 = tic;
  InsertionSort(vetorMedioCaso);
  tempoExecucaoMedioCaso = toc(t1);
  fprintf('Caso Medio => %ds \n', tempoExecucaoMedioCaso);
  
  t1 = tic;
  InsertionSort(vetorPiorCaso);
  tempoExecucaoPiorCaso = toc(t1);
  resultadoInsertion(k,:)=[n tempoExecucaoMelhorCaso tempoExecucaoMedioCaso tempoExecucaoPiorCaso];
  fprintf('Pior Caso => %ds \n', tempoExecucaoPiorCaso);
  
  
  fprintf('===QuickSort===\n');
  t1 = tic;
  QuickSort(vetorMelhorCaso, 1, n);
  tempoExecucaoMelhorCaso = toc(t1);
  fprintf('Melhor Caso => %d \n', tempoExecucaoMelhorCaso);
  
  t1 = tic;
  QuickSort(vetorMedioCaso, 1, n);
  tempoExecucaoMedioCaso = toc(t1);
  fprintf('Caso Medio => %ds \n', tempoExecucaoMedioCaso);
  
  t1 = tic;
  QuickSort(vetorPiorCaso, 1, n);
  tempoExecucaoPiorCaso = toc(t1);
  resultadoQuick(k,:)=[n tempoExecucaoMelhorCaso tempoExecucaoMedioCaso tempoExecucaoPiorCaso];
  fprintf('Pior Caso => %ds \n', tempoExecucaoPiorCaso);
  
  
  fprintf('===MergeSort===\n');
  t1 = tic;
  MergeSort(vetorMelhorCaso, n);
  tempoExecucaoMelhorCaso = toc(t1);
  fprintf('Melhor Caso => %ds \n', tempoExecucaoMelhorCaso);
  
  t1 = tic;
  MergeSort(vetorMedioCaso, n);
  tempoExecucaoMedioCaso = toc(t1);
  fprintf('Caso Medio=> %ds \n', tempoExecucaoMedioCaso );
  
  t1 = tic;
  MergeSort(vetorPiorCaso, n);
  tempoExecucaoPiorCaso = toc(t1);
  resultadoMerge(k,:)=[n tempoExecucaoMelhorCaso tempoExecucaoMedioCaso tempoExecucaoPiorCaso];
  fprintf('Pior Caso => %ds \n', tempoExecucaoPiorCaso);
  
  
  fprintf('===RandomizedQuickSort===\n');
  t1 = tic;
  RandomizedQuickSort(vetorMelhorCaso, 1, n);
  tempoExecucaoMelhorCaso = toc(t1);
  fprintf('Melhor Caso => %ds \n', tempoExecucaoMelhorCaso);
  
  t1 = tic;
  RandomizedQuickSort(vetorMedioCaso, 1, n);
  tempoExecucaoMedioCaso = toc(t1);
  fprintf('Caso Medio => %ds \n', tempoExecucaoMedioCaso);
  
  t1 = tic;
  RandomizedQuickSort(vetorPiorCaso, 1, n);
  tempoExecucaoPiorCaso = toc(t1);
  resultadoRandomizedQuick(k,:)=[n tempoExecucaoMelhorCaso tempoExecucaoMedioCaso tempoExecucaoPiorCaso];
  fprintf('Pior Caso => %ds \n\n', tempoExecucaoPiorCaso);
  
  k = k+1;
endfor
 
subplot(2,2,1); %Melhor Caso
plot(resultadoInsertion(:,1),resultadoInsertion(:,2),'-g'); hold on; %plotando tempos de InsertionSort
plot(resultadoQuick(:,1),resultadoQuick(:,2),'-r'); hold on; %plotando tempos de QuickSort
plot(resultadoMerge(:,1),resultadoMerge(:,2),'-b'); hold on; %plotando tempos de MergekSort
plot(resultadoRandomizedQuick(:,1),resultadoRandomizedQuick(:,2),'-y'); hold on; %plotando tempos de RandomizedQuickSort
legend('InsertionSort','QuickSort','MergeSort','RandomizedQuickSort','location','northwest');
legend boxoff;
title('Comparacao: Algoritmos de Ordenacao - Tempo de execucao Melhor Caso');
xlabel('Tamanho da entrada (n)');
ylabel('Tempo de execucao em segundos (s)');
plot(resultadoInsertion(:,1),resultadoInsertion(:,2),'dg'); hold on; %plotando tempos de InsertionSort - marcação na linha
plot(resultadoQuick(:,1),resultadoQuick(:,2),'dr'); hold on; %plotando tempos de QuickSort - marcação na linha
plot(resultadoMerge(:,1),resultadoMerge(:,2),'db'); hold on; %plotando tempos de MergeSort - marcação na linha
plot(resultadoRandomizedQuick(:,1),resultadoRandomizedQuick(:,2),'dy'); %plotando tempos de RandomizedQuickSort - marcação na linha


subplot(2,2,2); %Caso Médio
plot(resultadoInsertion(:,1),resultadoInsertion(:,3),'-g'); hold on; %plotando tempos de InsertionSort
plot(resultadoQuick(:,1),resultadoQuick(:,3),'-r'); hold on; %plotando tempos de QuickSort 
plot(resultadoMerge(:,1),resultadoMerge(:,3),'-b'); hold on; %plotando tempos de MergeSort 
plot(resultadoRandomizedQuick(:,1),resultadoRandomizedQuick(:,3),'-y'); hold on; %plotando tempos de RandomizedQuickSort
legend('InsertionSort','QuickSort','MergeSort','RandomizedQuickSort','location','northwest');
legend boxoff;
title('Comparacao: Algoritmos de Ordenacao - Tempo de execucao Caso Medio');
xlabel('Tamanho da entrada (n)');
ylabel('Tempo de execucao em segundos (s)');
plot(resultadoInsertion(:,1),resultadoInsertion(:,3),'dg'); hold on; %plotando tempos de InsertionSort - marcação na linha
plot(resultadoQuick(:,1),resultadoQuick(:,3),'dr'); hold on; %plotando tempos de QuickSort - marcação na linha
plot(resultadoMerge(:,1),resultadoMerge(:,3),'db'); %plotando tempos de MergeSort - marcação na linha
plot(resultadoRandomizedQuick(:,1),resultadoRandomizedQuick(:,3),'dy'); %plotando tempos de RandomizedQuickSort - marcação na linha


subplot(2,2,3); %Pior Caso
plot(resultadoInsertion(:,1),resultadoInsertion(:,4),'-g'); hold on; %plotando tempos de InsertionSort
plot(resultadoQuick(:,1),resultadoQuick(:,4),'-r'); hold on; %plotando tempos de QuickSort
plot(resultadoMerge(:,1),resultadoMerge(:,4),'-b'); hold on; %plotando tempos de MergeSort
plot(resultadoRandomizedQuick(:,1),resultadoRandomizedQuick(:,4),'-y'); hold on; %plotando tempos de RandomizedQuickSort
legend('InsertionSort','QuickSort','MergeSort','RandomizedQuickSort','location','northwest');
legend boxoff;
title('Comparacao: Algoritmos de Ordenacao - Tempo de execucao Pior Caso');
xlabel('Tamanho da entrada (n)');
ylabel('Tempo de execucao em segundos (s)');
plot(resultadoInsertion(:,1),resultadoInsertion(:,4),'dg'); hold on; %plotando tempos de InsertionSort - marcação na linha
plot(resultadoQuick(:,1),resultadoQuick(:,4),'dr'); %plotando tempos de QuickSort - marcação na linha
plot(resultadoMerge(:,1),resultadoMerge(:,4),'db'); %plotando tempos de MergeSort - marcação na linha
plot(resultadoRandomizedQuick(:,1),resultadoRandomizedQuick(:,4),'dy'); %plotando tempos de RandomizedQuickSort - marcação na linha
