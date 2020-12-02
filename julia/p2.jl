function eval_password(line)
    parts = split(line, " ");
    idxs = split(parts[1], "-");
    _min = parse(Int, idxs[1]);
    _max = parse(Int, idxs[2]);
    letter = parts[2][1];
    password = parts[3];
    cnt = 0;

    for c in password
        if c == letter
            cnt += 1;
        end
    end

    return (_min <= cnt) & (cnt <= _max)
end

function eval_password2(line)
    parts = split(line, " ");
    idxs = split(parts[1], "-");
    _min = parse(Int, idxs[1]);
    _max = parse(Int, idxs[2]);
    letter = parts[2][1];
    password = parts[3];

    return ((password[_min] == letter) & (password[_max] != letter)) |
           ((password[_min] != letter) & (password[_max] == letter))
end

function main()
    fname = "../data/p2.txt";
    open(fname) do f
        tot1 = 0;
        tot2 = 0;
        for (i, line) in enumerate(eachline(f))
            tot1 = tot1 + eval_password(line);
            tot2 = tot2 + eval_password2(line);
        end
        println("Tot part 1: ", tot1);
        println("Tot part 2: ", tot2);
    end
end

main()
