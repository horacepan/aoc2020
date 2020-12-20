function move_dir(dir, arg)
    dx = 0;
    dy = 0;

    if dir == 'N'
        dx += arg;
    elseif dir == 'S'
        dx -= arg;
    elseif dir == 'E'
        dy += arg;
    elseif dir == 'W'
        dy -= arg;
    end

    return dx, dy;
end

function step(opp, arg, curr_dir, dirs, dirs_dict)
    dx = 0;
    dy = 0;

    if opp == 'L'
        turns = -div(arg, 90);
        dir = dirs[mod1(dirs_dict[curr_dir] + turns, 4)];
    elseif opp == 'R'
        turns = div(arg, 90);
        dir = dirs[mod1(dirs_dict[curr_dir] + turns, 4)];
    elseif opp == 'F'
        dir = curr_dir;
        dx, dy = move_dir(curr_dir, arg);
    else
        dir = curr_dir;
        dx, dy = move_dir(opp, arg);
    end

    return dir, dx, dy;
end

function step_two(opp, arg, wx, wy)
    dx = 0;
    dy = 0;
    sx = 0;
    sy = 0;

    if opp == 'L'
        dx = -wx;
        dy = -wy;
        if arg == 90
            dx += (wy);
            dy += (-wx);
        elseif arg == 180
            dx += (-wx);
            dy += (-wy);
        elseif arg == 270
            dx += (-wy);
            dy += (wx);
        end
    elseif opp == 'R'
        dx = -wx;
        dy = -wy;
        if arg == 90
            dx += (-wy);
            dy += (wx);
        elseif arg == 180
            dx += (-wx);
            dy += (-wy);
        elseif arg == 270
            dx += (wy);
            dy += (-wx);
        end
    elseif opp == 'F'
        sx = arg * wx;
        sy = arg * wy;
    else
        dx, dy = move_dir(opp, arg);
    end

    return sx, sy, dx, dy;;
end


function part_one(lines)
    '''

    '''
    dirs = ['N', 'E', 'S', 'W'];
    dirs_dict = Dict(
        'N' => 1,
        'E' => 2,
        'S' => 3,
        'W' => 4
    )
    x = 0;
    y = 0;
    curr_dir = 'E';

    for l in lines
        opp = l[1];
        arg = parse(Int, l[2:end]);
        new_dir, dx, dy = step(opp, arg, curr_dir, dirs, dirs_dict);
        curr_dir = new_dir;
        x += dx;
        y += dy;
    end

    println("Part one: $(abs(x) + abs(y))");
end

function part_two(lines)
    x = 0;
    y = 0;
    wx = 1;
    wy = 10;

    for l in lines
        opp = l[1];
        arg = parse(Int, l[2:end]);
        sx, sy, dx, dy = step_two(opp, arg, wx, wy);
        x += sx;
        y += sy;
        wx += dx;
        wy += dy;
    end

    println("Part two: $(abs(x) + abs(y))");
end

function main()
    fname = "../data/p12.txt";
    lines = readlines(fname);
    part_one(lines);
    part_two(lines);
end

main();
