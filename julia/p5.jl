function get_row(line)
    lo = 0;
    hi = 2^length(line) - 1;
    for c in line
        if c == 'B'
            lo = div(lo + hi + 1, 2);
        else
            hi = div(lo + hi, 2);
        end
    end
    return lo;
end

function get_col(line)
    lo = 0;
    hi = 2^length(line) - 1;

    for c in line
        if c == 'R'
            lo = div(lo + hi + 1,  2);
        else
            hi = div(lo + hi, 2);
        end
    end
    return lo;
end

function get_id(line)
    row = get_row(line[begin:end-3]);
    col = get_col(line[end-2:end]);
    return 8row + col;
end

function main()
    fname = "../data/p5.txt";
    lines = readlines(fname);
    maxid = 0;
    ids = [];

    for l in lines
        id = get_id(l);
        maxid = max(id, maxid);
        push!(ids, id);
    end

    println("Part one: ", maxid);
    sort!(ids);
    for (idx, x) in enumerate(ids)
        if (idx > 1) && ((x - ids[idx - 1]) > 1)
            println("Part two: ", x - 1);
            break;
        end
    end
end

main();
