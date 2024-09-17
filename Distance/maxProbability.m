function maxProbability(classes, vector)
    numClasses = length(classes);
    probabilities = zeros(1, numClasses);
    
    % Calcular la probabilidad para cada clase
    for i = 1:numClasses
        % Extraer el centroide como coordenadas x, y
        meanClass = classes(i).Centroid.Position; % Extraer las coordenadas [x, y]
        points = classes(i).Points; % Puntos de la clase
        covMatrix = cov(points'); % Matriz de covarianza de los puntos de la clase
        
        % Asegurarse de que la matriz de covarianza no sea singular
        if det(covMatrix) == 0
            covMatrix = covMatrix + eye(size(covMatrix)) * 1e-5; % Regularización
        end
        
        % Diferencia entre el vector y el centroide
        diff = vector - meanClass;
        
        % Calcular la densidad de probabilidad de la normal multivariante
        n = length(vector);
        prob = (1 / ((2 * pi)^(n / 2) * sqrt(det(covMatrix)))) * ...
               exp(-0.5 * (diff / covMatrix * diff'));
        
        probabilities(i) = prob; % Guardar la probabilidad de esta clase
    end
    
    % Normalizar las probabilidades para que sumen 1
    probabilities = probabilities / sum(probabilities);
    
    % Encontrar la clase con la probabilidad más alta
    [~, classIndex] = max(probabilities);
    
    fprintf('El vector pertenece a la clase %d con la máxima probabilidad.\n', classIndex);
    disp('Probabilidades normalizadas para cada clase:');
    for i = 1:numClasses
        fprintf('Clase %d: %f\n', i, probabilities(i));
    end

    drawer(classes, vector);
end
