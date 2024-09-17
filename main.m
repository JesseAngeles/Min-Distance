clc; % Limpia la pantalla
clear all; % Limpia el espacio de trabajo
close all; % Cierra todas las figuras
warning off all; % Desactiva las advertencias

% Añadir rutas
addpath('classDef');
addpath('Distance');

% Definir variables
[classes, radius] = setClasses();
vector = setVector();

% Ejecutar el menú
option = 1;

while option
    option = menu();

    

    switch(option)
        case 0
            disp('bye');
        case 1
            [classes, radius] = setClasses();
        case 2
            vector = setVector();
        case 3
            euclidian(classes, vector, radius);
        case 4
            mahalanobis(classes, vector, radius);
        case 5
            maxProbability(classes, vector);
            break;
        otherwise
            disp('Invalid option. Please select again.');
    end
end



