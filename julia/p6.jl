function group_uniques(lines)
    vals = Set();
    for ln in lines
        for c in ln
            push!(vals, c);
        end
    end
    return length(vals);
end

function group_all_uniques(lines)
    vals = nothing;
    # new set for each line
    qset = nothing;

    for ln in lines
        qset = Set();
        for c in ln
            push!(qset, c);
        end
        if vals == nothing
            vals = qset;
        else
            vals = intersect(vals, qset);
        end
    end
    return length(vals);
end

function main()
    fname = "../data/p6.txt";
    lines = readlines(fname);
    tot = 0;
    tot_all = 0;
    curr_group = [];

    for ln in lines
        if length(ln) == 0
            tot += group_uniques(curr_group);
            tot_all += group_all_uniques(curr_group);
            curr_group = [];
        else
            push!(curr_group, ln);
        end
    end

    println("Part one: $tot");
    println("Part two: $tot_all");
end

main();
