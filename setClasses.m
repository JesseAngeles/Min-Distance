function [classes, radius] = setClasses()
    % Pedir el número de clases y elementos por clase
    n_classes = input('Number of classes: ');
    n_element = input('Number of elements per class: ');

    % Inicializar el arreglo de clases
    classes = Class.empty(n_classes, 0);
    sumRadius = 0;

    for i = 1:n_classes
        % Pedir la posición del centroide, radio y color
        position = input('Centroid position [x y]: ');
        x = position(1);
        y = position(2);
        radius = input('Set radius: ');
        sumRadius = sumRadius + radius;
        color = input('RGB color [r g b]: ');
        r = color(1);
        g = color(2);
        b = color(3);
        
        % Crear el objeto Point2D y Color
        centroid = Point2D([x, y], Color(r, g, b), [5, 0, 0, 0]);
        classObj = Class(centroid, n_element, Color(r, g, b), radius);
        
        % Añadir el objeto Class al arreglo
        classes(i) = classObj;
    end

    % Calcular el radio promedio
    radius = sumRadius / n_classes;
    disp(radius);
end
