function [] = dispMaze(maze)

% Color map
cmap = [1 1 1; .62 .29 1; 1 1 1; 1 .75 0; 1 .75 0; 1 1 1; 1 1 1; .3 .3 .3];

%% CALCULATIONS ---
% Create live imagery of map
hmo = imagesc(maze);
colormap(cmap);
set(gca, 'XColor', 'none');
set(gca, 'Ycolor', 'none');
drawnow
