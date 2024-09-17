function mahalanobis(classes, vector, radius)
    numClasses = length(classes);
    mahalanobisDistances = zeros(numClasses, 1);
    
    % Calcular la distancia de Mahalanobis para cada clase
    for i = 1:numClasses
        classPoints = classes(i).Points; 
        
        % Calcular la media de la clase
        classMean = classes(i).Centroid.Position';
        
        % Calcular la covarianza de la clase
        covMatrix = covariance(classPoints);  % Pasar solo los puntos
        
        if det(covMatrix) == 0
            covMatrix = covMatrix + eye(size(covMatrix)) * 1e-5; % Regularización
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
