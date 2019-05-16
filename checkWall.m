function [output] = checkWall(fPos, pPos)

if fPos.row ~= pPos.row && fPos.col ~= pPos.col
    output = 1;
else
    output = 0;
end
