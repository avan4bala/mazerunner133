%% INITIALIZATION ---
% Asks for user input of size and difficulty

response = inputdlg({'Maze Size?:', 'Maze Difficulty?:'}, 'Input', 1);
size = str2num(response{1});
difficulty = str2num(response{2});

% Checks to see if intervals and numbers are inputtable and will work

while size > 100 || size <= 5 || difficulty < 1 || difficulty > 10
    response = inputdlg({'Maze Size?:', 'Maze Difficulty?:'}, 'Try Again', 1);
    size = str2num(response{1});
    difficulty = str2num(response{2});
end

%% CALCULATIONS ---
[maze, wall, position, endPoint] = setup(size);
% Runs the maze generator until there are no more walls to be added
while numel(wall) > 0
    [maze, position, wall] = move(maze, position, wall, difficulty);
    dispMaze(maze);
end
maze = adjustEnd(maze, endPoint);

%% FORMATTED TEXT & FIGURE DISPLAYS ---
dispMaze(maze);
fprintf('Maze is done\n');
clear
