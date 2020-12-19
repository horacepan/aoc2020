function is_occupied(grid, x, y)
    return grid[x][y] == '#';
end

function is_empty(grid, x, y)
    return grid[x][y] == 'L';
end

function shape(grid)
    rows = length(grid);
    cols = length(grid[1]);
    return rows, cols;
end

function nbrs(grid, x, y);
    rows, cols = shape(grid);
    neighbors = [
        (x - 1, y - 1),
        (x - 1, y),
        (x - 1, y + 1),
        (x, y - 1),
        (x, y + 1),
        (x + 1, y - 1),
        (x + 1, y),
        (x + 1, y + 1)
    ];
    empty_adj = 0;
    occ_adj = 0;

    for (a, b) in neighbors
        if (1 <= a <= rows) && (1 <= b <= cols)
            if is_empty(grid, a, b)
                empty_adj += 1;
            elseif is_occupied(grid, a, b)
                occ_adj += 1;
            end
        end
    end

    return empty_adj, occ_adj;
end

function visible_nbrs(grid, x, y)
    rows, cols = shape(grid);
    deltas = [
        (-1, -1),
        (-1, 0),
        (-1, 1),
        (0, -1),
        (0, 1),
        (1, -1),
        (1, 0),
        (1, 1),
    ];
    empty_adj = 0;
    occ_adj = 0;

    for (dx, dy) in deltas
        found_nbr = false;
        sx = x;
        sy = y;
        while !found_nbr
            sx += dx;
            sy += dy;

            if (1 <= sx <= rows) && (1 <= sy <= cols)
                if (grid[sx][sy] == EMPTY)
                    empty_adj += 1;
                    break;
                elseif grid[sx][sy] == OCC
                    occ_adj += 1;
                    break;
                end
            else
                break;
            end
        end
    end

    return empty_adj, occ_adj;
end

function new_seat(grid, x, y)
    EMPTY = 'L';
    OCC = '#';
    FL = '.';
    empty_adj, occ_adj = nbrs(grid, x, y);

    if (grid[x][y] == EMPTY) && occ_adj == 0
        return OCC;
    elseif (grid[x][y] == OCC) && occ_adj >= 4
        return EMPTY;
    else
        return grid[x][y];
    end
end

function num_occ(grid)
    OCC = '#';
    rows, cols = shape(grid);

    cnt = 0;
    for i in 1:rows
        for j in 1:cols
            if grid[i][j] == OCC
                cnt += 1;
            end
        end
    end
    return cnt;
end

function part_one(grid)
    rows, cols = shape(grid);
    new_grid = deepcopy(grid);

    for x in 1:1000
        nchanges = 0;
        for i in 1:rows
            for j in 1:cols
                old_val = grid[i][j];
                new_val = new_seat(grid, i, j);
                if new_val != old_val
                    nchanges += 1;
                    new_grid[i][j] = new_val;
                end
            end
        end
        grid = deepcopy(new_grid);
        if nchanges == 0
            println("Part one: ", num_occ(grid));
            return;
        end
    end

end

function part_two(grid)
    rows, cols = shape(grid);
    new_grid = deepcopy(grid);

    for x in 1:1000
        nchanges=  0;
        for i in 1:rows
            for j in 1:cols
                old_val = grid[i][j];
                empty_adj, occ_adj = visible_nbrs(grid, i, j);

                if (grid[i][j] == EMPTY) && occ_adj == 0
                    new_grid[i][j] = OCC;
                    nchanges += 1;
                elseif (grid[i][j] == OCC) && occ_adj >= 5
                    new_grid[i][j] = EMPTY;
                    nchanges += 1;
                end

            end
        end

        grid = deepcopy(new_grid);

        if nchanges == 0
            println("Part two: ", num_occ(grid));
            return;
        end

    end
end

function main()
    fname = "../data/p11.txt";
    lines = readlines(fname);
    chars = [[c for c in l] for l in lines];
    part_one(chars);
    part_two(chars);
end

EMPTY = 'L';
OCC = '#';
FL = '.';
grid = [
    [EMPTY, OCC, EMPTY],
    [OCC, OCC, FL],
    [EMPTY, FL, FL],
];
# println(nbrs(grid, 2, 2));
main();
