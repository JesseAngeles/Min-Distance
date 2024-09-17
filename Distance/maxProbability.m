function maxProbability(classes, vector)
    numClasses = length(classes);
    probabilities = zeros(1, numClasses);
    
    % Calcular la probabilidad para cada clase
    for i = 1:numClasses
        classPoints = classes(i).Points;  % Obtener los puntos de la clase
        classMean = classes(i).Centroid.Position';  % Media (centroide) de la clase
        covMatrix = covariance(classPoints);  % Calcular la matriz de covarianza

        % Regularización en caso de que la matriz de covarianza sea singular
        if det(covMatrix) == 0
            covMatrix = covMatrix + eye(size(covMatrix)) * 1e-5;
        end
        covMatrixInv = inv(covMatrix);  % Invertir la matriz de covarianza

        % Diferencia entre el vector de entrada y el centroide de la clase
        diff = vector(:) - classMean;  % Asegurarse de que ambos sean columnas
        
        % Calcular la densidad de probabilidad de la distribución normal multivariante
        n = length(vector);  % Dimensión del vector
        prob = (1 / ((2 * pi)^(n / 2) * sqrt(det(covMatrix)))) * ...
               exp(-0.5 * (diff' * covMatrixInv * diff));  % Probabilidad
        
        % Guardar la probabilidad para esta clase
        probabilities(i) = prob;
    end
    
    % Normalizar las probabilidades para que sumen 1
    probabilities = probabilities / sum(probabilities);
    
    % Encontrar la clase con la probabilidad más alta
    [~, classIndex] = max(probabilities);
    
    % Mostrar el resultado
    fprintf('El vector pertenece a la clase %d con la máxima probabilidad.\n', classIndex);
    disp('Probabilidades normalizadas para cada clase:');
    for i = 1:numClasses
        fprintf('Clase %d: %f\n', i, probabilities(i));
    end

    % Graficar las clases y el vector
    drawer(classes, vector);
end
