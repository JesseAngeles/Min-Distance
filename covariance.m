function covMatrix = covariance(points)
    % Asegúrate de que points sea una matriz N x 2
    if size(points, 1) < 2
        error('La matriz de puntos debe tener al menos dos filas (x y).');
    end
    
    % Centrar los datos: restar la media de cada dimensión
    meanPoints = mean(points, 2); % Media por filas
    centeredPoints = points - meanPoints; 
    
    % Calcular la matriz de covarianza
    covMatrix = (1 / (size(centeredPoints, 2) - 1)) * (centeredPoints * centeredPoints');
end
