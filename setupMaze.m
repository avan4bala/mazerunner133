function [maze, wall, position, endPos] = setup(size)
%% makes the maze by size input
maze = zeros(size);
maze(1, 1:end) = 8;
maze(1:end, 1) = 8;
maze(end, 1:end) = 8;
maze(1:end, end) = 8;

%% CALCULATIONS ---
%% positions the walls by calling the setMazePosition variable like a coordinate system
position = point(size, randi([2 (size - 1)]));
maze = setMazePosition(maze, position, 3);
position = adjust(position, -1, 0);
maze = setMazePosition(maze, position, 1);
wall(1, 1) = position.row;
wall(2, 1) = position.col;

endPos = point(1, randi([2 (size - 1)]));
maze = setMazePosition(maze, endPos, 4);
