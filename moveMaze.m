function [maze, position, walls] = move(maze, position, walls, difficulty)
% directions = [up, down, left, right]
[directions] = validateMove(maze, position);

%% CALCULATIONS ---
% Check if that route can continue or not
if any(directions) == 0
    if same(position, walls) == 1
        % Remove last wall
        walls = walls(:, 1 : end - 1);
    else
        position = point(walls(1, end), walls(2, end));
    end
else
    % Random direction
    locations = directions .* floor(100.0/sum(directions));
    % Increase if difficulty is 1
    locations(1) = locations(1) * (1 - ((difficulty - 5.0)/14));
    locations(2) = locations(2) * (1 + ((difficulty - 5.0)/14));
    locations(3) = locations(3) * (1 + ((difficulty - 5.0)/14));
    locations(4) = locations(4) * (1 + ((difficulty - 5.0)/14));
    if sum(locations) ~= 100
        for k = 1:4
            if directions(k) == 1
                locations(k) = locations(k) + 100 - sum(locations);
            end
        end
    end
    % Randomizes direction
    r = randi([1 100]);
    if r <= locations(1)
        futurePos = point(position.row - 1, position.col);
    elseif r <= locations(2) + locations(1)
        futurePos = point(position.row + 1, position.col);
    elseif r <= locations(3) + locations(2) + locations(1)
        futurePos = point(position.row, position.col - 1);
    else
        futurePos = point(position.row, position.col + 1);
    end
    
    % Find previous number 1
    if mazeValue(maze, position, -1, 0) == 1
        previousPos = point(position.row - 1, position.col);
    elseif mazeValue(maze, position, 1, 0) == 1
        previousPos = point(position.row + 1, position.col);
    elseif mazeValue(maze, position, 0, -1) == 1
        previousPos = point(position.row , position.col - 1);
    else % mazeValue(maze, position, 0, 1) == 1
        previousPos = point(position.row, position.col + 1);
    end

    % Check if wall created
    if checkNode(futurePos, previousPos) == 1
        walls(1, end + 1) = position.row;
        walls(2, end) = position.col;
    end

    position = futurePos;
    maze = setMazePosition(maze, position, 1);
end
