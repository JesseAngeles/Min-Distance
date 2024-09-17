clc; % Limpia la pantalla
clear; % Limpia el espacio de trabajo
close all; % Cierra todas las figuras
warning off all; % Desactiva las advertencias


% Añadir rutas
addpath('classDef');
addpath('Distance');

% Datos predeterminados
centroids = [0 5; 5 0; 4 4];
radii = [10, 10, 4];
colors = [255 0 0; 0 255 0; 0 0 255];
numElements = 250;

% Inicializar clases
numClasses = size(centroids, 1);
classes = Class.empty(numClasses, 0);

for i = 1:numClasses
    centroid = Point2D(centroids(i, :), Color(colors(i, 1), colors(i, 2), colors(i, 3)));
    class = Class(centroid, numElements, Color(colors(i, 1), colors(i, 2), colors(i, 3)), radii(i));
    classes(i) = class;
end

% Vector de prueba por defecto
vector = [2 2];

maxProbability(classes, vector);