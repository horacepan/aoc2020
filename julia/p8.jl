function dispatch(line)
    op, num = split(line, " ");

    if op == "nop"
        return 0, 1;
    elseif op == "jmp"
        return 0, parse(Int, num);
    elseif op == "acc"
        return parse(Int, num), 1;
    end
end

function compute(lines)
    acc = 0;
    idx = 1;
    completed = false;
    visited = Set()

    while true
        if idx in visited
            break;
        elseif idx > length(lines)
            completed = true;
            break;
        else
            push!(visited, idx);
        end;

        ln = lines[idx];
        d_acc, d_idx = dispatch(ln);
        idx += d_idx;
        acc += d_acc;
    end

    return acc, completed;
end

function main()
    fname = "../data/p8.txt";
    lines = readlines(fname);

    ac, comp = compute(lines);
    println("Part one: $ac, $comp");

    if comp
        println("Part two: $ac");
    end

    for i in 1:length(lines)
        if contains(lines[i], "nop")
            lines[i] = "jmp" * lines[i][4:end];
            ac, comp = compute(lines);
            lines[i] = "nop" * lines[i][4:end];
        elseif contains(lines[i], "jmp")
            lines[i] = "nop" * lines[i][4:end];
            ac, comp = compute(lines);
            lines[i] = "jmp" * lines[i][4:end];
        end

        if comp
            println("Part two: $ac");
            break;
        end
    end
end

main()
