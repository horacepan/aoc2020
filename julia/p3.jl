function solve_slope(lines, dx, dy)
    rows = length(lines);
    cols = length(lines[1]);
    loc_x = 0;
    loc_y = 0;
    ntrees = 0;

    while true
        if (loc_x < rows)
            ntrees += Int(lines[loc_x+1][loc_y+1] == '#');
        else
            break;
        end

        loc_x += dx;
        loc_y = (loc_y + dy) % cols;
    end

    return ntrees;
end


function main()
    fname = "../data/p3.txt";
    lines = readlines(fname);
    a1 = solve_slope(lines, 1, 1);
    a2 = solve_slope(lines, 1, 3);
    a3 = solve_slope(lines, 1, 5);
    a4 = solve_slope(lines, 1, 7);
    a5 = solve_slope(lines, 2, 1);
    vals = [a1, a2, a3, a4, a5];
    println("Part one: ", a2);
    println("Part two: ", prod(vals));
end

main()
