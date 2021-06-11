% Menú inicial: Elige entre audio o secuencia
option = menu('Elige una categoría', 'Audio', 'Conjunto de muestras');

switch option
    case 1 % Interfaz de audio
        GUI
    case 2 % Interfaz de secuencia
        GUI2
end