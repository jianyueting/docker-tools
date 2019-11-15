local M = {};

local function addRows(result,rows)
    for m,n in pairs(rows) do
        result[m] = n;
    end
end

local function M:addRows(row1,row2)
    var row = {};
    addRows(row,row1);
    addRows(row,row2);
    return row;
end

return M;