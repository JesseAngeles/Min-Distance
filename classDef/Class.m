classdef Class
    properties
        Centroid % Objeto de tipo Point2D
        Points % Matriz 2xN de puntos (coordenadas)
        Color % Objeto de tipo Color
        Radius % Radio
        Name % Nombre de la clase
    end
    
    methods
        function obj = Class(centroid, nElement, color, radius)
            % Constructor para inicializar la clase
            obj.Centroid = centroid;
            obj.Color = color;
            obj.Radius = radius;
            obj.Name = '';
            
            % Crear los puntos y asignar el color
            obj = obj.createPoints(nElement, radius);
            obj = obj.setColor(color);
        end
        
        function obj = ClassWithPoints(points, color)
            % Constructor alternativo para inicializar la clase con puntos
            obj.Points = points;
            obj.Color = color;
            obj.Centroid = obj.calculateCentroid();
            obj.Name = '';
        end
        
        function points = getPoints(obj)
            % Getter para los puntos
            points = obj.Points;
        end
        
        function centroid = getCentroid(obj)
            % Getter para el centroide
            centroid = obj.Centroid;
        end
        
        function name = getName(obj)
            % Getter para el nombre
            name = obj.Name;
        end
        
        function obj = setColor(obj, color)
            % Setter para el color
            obj.Color = color;
            obj.Centroid.Color = color;
            % No se puede aplicar color a los puntos directamente, solo almacenar el color
        end
        
        function obj = setPoints(obj, points)
            % Setter para los puntos
            obj.Points = points;
            obj.Centroid = obj.calculateCentroid();
        end
        
        function obj = setName(obj, name)
            % Setter para el nombre
            obj.Name = name;
        end
        
        function obj = clearPoints(obj)
            % Limpiar los puntos
            obj.Points = [];
        end
    end
    
    methods (Access = private)
        function obj = createPoints(obj, nElement, radius)
            % Crear puntos alrededor del centroide
            rng('shuffle'); % Inicializar generador de números aleatorios
            
            % Generar puntos con distribución normal
            distributionX = radius / 6;
            distributionY = radius / 5;
            
            % Generar coordenadas en torno al centroide
            angles = linspace(0, 2*pi, nElement);
            x = obj.Centroid.Position(1) + distributionX * randn(1, nElement);
            y = obj.Centroid.Position(2) + distributionY * randn(1, nElement);
            
            % Asignar puntos a la propiedad
            obj.Points = [x; y];
            
            % Reajustar el centroide a partir de los puntos generados
            obj.Centroid = obj.calculateCentroid(); % Calcula el nuevo centroide a partir de los puntos
        end
        
        function centroid = calculateCentroid(obj)
            % Calcular el centroide a partir de los puntos
            if isempty(obj.Points)
                centroid = obj.Centroid;
                return;
            end
            
            x = mean(obj.Points(1, :));
            y = mean(obj.Points(2, :));
            
            centroid = Point2D([x, y], obj.Color, [5, 0, 0, 0]); % Ajustar el borde como en C++
        end
    end
end
