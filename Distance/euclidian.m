function euclidian(classes, vector, radius)
    % Comprobar si el arreglo de clases no está vacío
    if isempty(classes)
        error('El arreglo de clases está vacío.');
    end
    
    % Número de clases
    numClasses = length(classes);
    
    % Inicializar un vector para almacenar las distancias
    distances = zeros(numClasses, 1);
    
    % Calcular la distancia euclidiana desde el vector hasta cada centroide
    for i = 1:numClasses
        centroid = classes(i).Centroid.Position;   
        distances(i) = sqrt((vector(1) - centroid(1))^2 + (vector(2) - centroid(2))^2);
    end
    
    % Determinar si el vector pertenece a alguna clase
    [minDist, classIndex] = min(distances);
    
    if minDist <= radius
        fprintf('El vector pertenece a la clase %d con una distancia euclidiana de %.2f.\n', classIndex, minDist);
    else
        fprintf('El vector no pertenece a ninguna clase (distancia mínima %.2f es mayor al radio).\n', minDist);
    end
    
    % Mostrar los resultados
    disp('Distancias euclidianas desde el vector a cada centroide:');
    for i = 1:numClasses
        fprintf('Clase %d: %.2f\n', i, distances(i));
    end
    
    % Llamar a la función drawer para graficar
    drawer(classes, vector);
end
