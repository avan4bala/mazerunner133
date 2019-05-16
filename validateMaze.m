function [iconposition] = validate(maze, position)
iconposition = [1 1 1 1]; % Up, down, left, right
[nrow, ncol] = size(maze);

%% CALCULATIONS ---
% Check up
if position.row == 2
    iconposition(1) = 0;
elseif position.row == 3
    for z = [-1 0 1]
        if mazeValue(maze, position, -1, z) == 1
            iconposition(1) = 0;
        end
    end
else
    for k = [-2 -1]
        for z = [-1 0 1]
            if mazeValue(maze, position, k, z) == 1
                iconposition(1) = 0;
            end
        end
    end
end

% Check down
if position.row == nrow - 1
    iconposition(2) = 0;
elseif position.row == nrow - 2
    for z = [-1 0 1]
        if mazeValue(maze, position, 1, z) == 1
            iconposition(2) = 0;
        end
    end
else
    for k = [1 2]
        for z = [-1 0 1]
            if mazeValue(maze, position, k, z) == 1
                iconposition(2) = 0;
            end
        end
    end
end

% Check left
if position.col == 2
    iconposition(3) = 0;
elseif position.col == 3
    for z = [-1 0 1]
        if mazeValue(maze, position, z, -1) ==1
            iconposition(3) = 0;
        end
    end
else
    for k = [-1 0 1]
        for z = [-2 -1]
            if mazeValue(maze, position, k, z) == 1
                iconposition(3) = 0;
            end
        end
    end
end

% Check right
if position.col == ncol - 1
    iconposition(4) = 0;
elseif position.col == ncol - 2
    for z = [-1 0 1]
        if mazeValue(maze, position, z, 1) == 1
            iconposition(4) = 0;
        end
    end
else
    for k = [-1 0 1]
        for z = [1 2]
            if mazeValue(maze, position, k, z) == 1
                iconposition(4) = 0;
            end
        end
    end
end
