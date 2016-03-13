function c = urf_knn(P, y, Q,  k)
%avisa qual a coluna da imagem que está mais perto da que está sendo analisada
%entra com: 
%        P = matriz das imagens de treino que estao no banco de dados
%        y = numero de imagens que tem em P
%        Q = vetor imagem de teste
%        k = numero de imagens a ser analisadas
%sai com:
%       C = posiçao da coluna na matriz que tem mais semelhanças com a imagem sendo analisada

n = size(P,2);      %atribui a n o numero de colunas da matriz P
    if (nargin == 3)   %checa se urf_knn entrou com tres parametros
        k=1;          
    elseif (k>n)    
        k=n;
    end

    Q = repmat(Q, 1, n);         %repete a imagem de teste ate ter o memo tamanho em coluna da matriz com imagens de treino     
    distances = sqrt(sum(power((P-Q),2),1));   %a soma do modulo da diferença entre a matriz de treino e de teste
    [distances, idx] = sort(distances);        %deixa aleatorio a diferença entre as matrizes
    y = y(idx);                               
    y = y(1:k);
    h = histc(y,(1:max(y)));                 %faz um histograma entre o numero de colunas da matriz
                                             %e o vetor entre todos os seus valores em ordem crescente
    [v,c] = max(h);                          %numero de linhas do vetor retornado do histograma
                                             %?seria algo como o comprimento do histograma¿
end
