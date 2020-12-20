function slow_mult_inv(p)
    invs = Dict();
    for i in 1:p-1
        for j in 1:p-1
            if mod(i*j, p) == 1
                invs[i] = j;
                invs[j] = i;
            end
        end
    end
    return invs;
end

function part_one(lines)
    st = parse(Int, lines[1]);
    tokens = split(lines[2], ",");
    bs = [parse(Int, x) for x in tokens if x != "x"];
    pinvs = Dict(b=>slow_mult_inv(b) for b in bs);

    min_wait = Inf;
    min_id = 0;
    for b in bs
        wt = b - mod(st, b);
        if wt < min_wait
            min_id = b;
            min_wait = wt;
        end
    end
    println("Part one: ", min_wait * min_id);
end

function main()
    fname = "../data/p13.txt";
    lines = readlines(fname);
    part_one(lines);
end

main();
