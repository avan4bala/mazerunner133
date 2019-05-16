function [maze] = adjustEnd(maze, endPos)

% Set position below end p to be a 1 (start the connection process)
position = point(endPos.row + 1, endPos.col);
maze = setMazePosition(maze, position, 1);
connection = 0;
while connection == 0
    % Search for any 1 outputs
    if mazeValue(maze, position, 1, 0) == 1
        connection = 1;
    elseif mazeValue(maze, position, 0, -1) == 1
        connection = 1;
    elseif mazeValue(maze, position, 0, 1) == 1
        connection = 1;
    else
        % Move down if no outputs exist
        position = adjust(position, 1, 0);
        maze = setMazePosition(maze, position, 1);
    end
end
