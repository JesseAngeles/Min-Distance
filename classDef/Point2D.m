classdef Point2D
    properties
        Position % Vector de posición [x, y]
        Color % Color del punto
        Border % Borde del punto
    end
    
    methods
        function obj = Point2D(position, color, border)
            if nargin > 0
                obj.Position = position;
                obj.Color = color;
                if nargin > 2
                    obj.Border = border;
                else
                    obj.Border = [0, 0, 0, 0]; % Valor por defecto para el borde
                end
            end
        end
        
        function setColor(obj, color)
            obj.Color = color;
        end
        
        function setX(obj, x)
            obj.Position(1) = x;
        end
        
        function setY(obj, y)
            obj.Position(2) = y;
        end
        
        function x = getX(obj)
            x = obj.Position(1);
        end
        
        function y = getY(obj)
            y = obj.Position(2);
        end
    end
end
