function mahalanobis(classes, vector, radius)
    % Función que calcula la distancia de Mahalanobis del vector a cada clase
    % y determina a qué clase pertenece basándose en la distancia mínima.
    
    % Número de clases
    numClasses = length(classes);
    
    % Inicializar un vector para almacenar las distancias de Mahalanobis
    mahalanobisDistances = zeros(numClasses, 1);
    
    % Calcular la distancia de Mahalanobis para cada clase
    for i = 1:numClasses
        % Obtener los puntos de la clase actual
        classPoints = classes(i).Points; % Asumimos que Points es una matriz [2 x nElement] o similar
        
        % Asegurar que las dimensiones de los puntos y del vector sean correctas
        if size(classPoints, 1) ~= length(vector)
            error('Dimensionalidad del vector no coincide con los puntos de la clase');
        end
        
        % Calcular la media de la clase
        classMean = mean(classPoints, 2); % Media por filas (x y y)
        
        % Calcular la covarianza de la clase
        covMatrix = cov(classPoints'); % Covarianza de los puntos (transpuesta para tener [nElement x 2])
        
        % Invertir la matriz de covarianza, asegurando que sea invertible
        if det(covMatrix) == 0
            warning('La matriz de covarianza es singular. Saltando la clase %d.', i);
            mahalanobisDistances(i) = Inf;
            continue;
        end
        covMatrixInv = inv(covMatrix);
        
        % Calcular la distancia de Mahalanobis
        diff = vector(:) - classMean;  % Asegurar que el vector sea una columna
        mahalanobisDistances(i) = sqrt(diff' * covMatrixInv * diff);
    end
    
    % Encontrar la distancia mínima
    [minDist, classIndex] = min(mahalanobisDistances);
    
    % Decidir si el vector pertenece a alguna clase (si está dentro del radio)
    if minDist <= radius
        fprintf('El vector pertenece a la clase %d con una distancia de Mahalanobis de %.2f.\n', classIndex, minDist);
    else
        fprintf('El vector no pertenece a ninguna clase (distancia mínima %.2f es mayor al radio).\n', minDist);
    end
    
    % Mostrar todas las distancias calculadas
    disp('Distancias de Mahalanobis a cada clase:');
    for i = 1:numClasses
        fprintf('Clase %d: %.2f\n', i, mahalanobisDistances(i));
    end
    
    % Graficar las clases, el vector y las distancias
    drawer(classes, vector);
end
