function num_outer(bags, color)
    cnt = 0;
    visited = Dict();
    for k, v in bags
        if haskey(visited, k)
            if visited[k] == true
                cnt += 1;
            end
        end

        # not visited
        for c in v
            # check these
        end
    end
end

function contains_color(bags, color)
    for b in bags
        if contains_color(bags[b], color)
            return true;
        end
    end
    return false;
end

function bag_dict(lines)
    bags = Dict();
    for ln in lines

    end
    return bags;
end

function main()
    fname = "../data/p7.txt";
    lines = readlines(fname);
    bags = bag_dict(lines);
    gold_exts = num_outer(bags, bag_color);

    println("Part one: $gold_exts");
end


main()
