function drawer(classes, vector)
    % Función para graficar puntos basados en un arreglo de objetos de clase
    % y líneas desde los centroides al vector.
    
    % Comprobar si el arreglo de clases no está vacío
    if isempty(classes)
        error('El arreglo de clases está vacío.');
    end
    
    % Colores y marcadores para las diferentes clases
    colors = ['r', 'b', 'g']; % Colores: rojo, azul, verde
    markers = {'o', 'o', 'o'}; % Marcadores: círculo
    
    % Inicializar la figura
    figure;
    hold on;
    
    % Graficar los puntos de cada clase
    for i = 1:length(classes)
        % Extraer el centroide y el radio
        centroid = classes(i).Centroid.Position; % Asumimos que Position es un vector [x, y]
        radius = classes(i).Radius;
        colorObj = classes(i).Color;
        
        % Convertir el color a formato hexadecimal
        color = [colorObj.R / 255, colorObj.G / 255, colorObj.B / 255]; % Normalizado para MATLAB
        
        % Generar puntos alrededor del centroide
        points = classes(i).Points;
        
        % Graficar los puntos de la clase
        plot(points(1, :), points(2, :), 'o', 'MarkerFaceColor', color, 'MarkerEdgeColor', 'k', 'MarkerSize', 5);
    end
    
    % Graficar el vector de prueba
    plot(vector(1), vector(2), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8);
    
    % Graficar líneas desde el centroide al vector
    for i = 1:length(classes)
        centroid = classes(i).Centroid.Position;
        plot([centroid(1), vector(1)], [centroid(2), vector(2)], 'k--'); % Línea discontinua negra
    end
    
    % Configurar la cuadrícula y leyenda
    grid on;
    legendEntries = arrayfun(@(x) sprintf('Clase %d', x), 1:length(classes), 'UniformOutput', false);
    legendEntries{end+1} = 'Vector'; % Añadir leyenda para el vector
    
    legend(legendEntries);
    hold off;
end
