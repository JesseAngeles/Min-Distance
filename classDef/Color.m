classdef Color
    properties
        R % Componente rojo
        G % Componente verde
        B % Componente azul
    end
    
    methods
        function obj = Color(r, g, b)
            if nargin > 0
                obj.R = r;
                obj.G = g;
                obj.B = b;
            end
        end
    end
end
