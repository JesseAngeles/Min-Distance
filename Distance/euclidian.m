function euclidian(classes, vector, radius)
    % Función para calcular la distancia euclidiana entre un vector y los centroides de las clases
    % y determinar si el vector pertenece a alguna clase basándose en el radio
    
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
        % Extraer el centroide de la clase actual
        centroid = classes(i).Centroid.Position; % Asumimos que Position es un vector [x, y]
        
        % Calcular la distancia euclidiana
        distances(i) = sqrt((vector(1) - centroid(1))^2 + (vector(2) - centroid(2))^2);
    end
    
    % Determinar si el vector pertenece a alguna clase
    minDistance = min(distances);
    
    if minDistance <= radius
        fprintf('El vector pertenece a la clase más cercana.\n');
    else
        fprintf('El vector no pertenece a ninguna clase.\n');
    end
    
    % Mostrar los resultados
    disp('Distancias euclidianas desde el vector a cada centroide:');
    for i = 1:numClasses
        fprintf('Clase %d: %.2f\n', i, distances(i));
    end
    
    drawer(classes, vector);
end
