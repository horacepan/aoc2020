function get_record(lines)
    rec = Dict();
    for ln in lines
        parts = split(ln, " ");
        for p in parts
            k, v = split(p, ":");
            rec[k] = v;
        end
    end
    return rec;
end

function is_valid(rec)
    return (length(rec) == 8) | ((length(rec) == 7) & !haskey(rec, "cid"));
end

function main()
    fname = "../data/p4.txt";
    lines = readlines(fname);
    curr_line = [];
    tot_rec = 0;

    for ln in lines
        if length(ln) == 0
            rec = get_record(curr_line);
            tot_rec += Int(is_valid(rec));
            curr_line = [];
        else
            push!(curr_line, ln);
        end
    end
    println("Part one: ", tot_rec);
end
main()
