VALID_KEYS = Set([
    "byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "pid", "cid"
])

EYE_COLORS = Set(["amb", "blu", "brn", "gry", "grn", "hzl", "oth"])

HAIR_CHARS = Set(['a', 'b', 'c', 'd', 'e', 'f', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']);

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

function valid_keys(rec)
    global VALID_KEYS;
    for k in VALID_KEYS
        if !(haskey(rec, k)) & (k != "cid")
            return false;
        end
    end
    return true;
end

function valid_byr(v)
    return (length(v) == 4) & (1920 <= parse(Int, v) <= 2002);
end

function valid_iyr(v)
    return (length(v) == 4) & (2010 <= parse(Int, v) <= 2020);
end

function valid_eyr(v)
    return (length(v) == 4) & (2020 <= parse(Int, v) <= 2030);
end

function valid_hgt(v)
    if contains(v, "in")
        return 59 <= parse(Int, v[begin:end-2]) <= 76;
    elseif contains(v, "cm")
        return 150 <= parse(Int, v[begin:end-2]) <= 193;
    else
        return false;
    end
end

function valid_hcl(v)
    global HAIR_CHARS;
    return (v[1] == '#') && (length(v) == 7) && all([x in HAIR_CHARS for x in v[2:end]]);
end

function valid_ecl(v)
    global EYE_COLORS;
    return v in EYE_COLORS;
end

function valid_pid(v)
    return length(v) == 9;
end

function is_valid_strict(rec)
    return is_valid(rec) &&
           valid_keys(rec) &&
           valid_byr(rec["byr"]) &&
           valid_iyr(rec["iyr"]) &&
           valid_eyr(rec["eyr"]) &&
           valid_hgt(rec["hgt"]) &&
           valid_hcl(rec["hcl"]) &&
           valid_ecl(rec["ecl"]) &&
           valid_pid(rec["pid"]);
end

function main()
    fname = "../data/p4.txt";
    lines = readlines(fname);
    curr_line = [];
    tot_rec = 0;
    tot_rec_strict = 0;

    for ln in lines
        if length(ln) == 0
            rec = get_record(curr_line);
            tot_rec += Int(is_valid(rec));
            tot_rec_strict += Int(is_valid_strict(rec));
            curr_line = [];
        else
            push!(curr_line, ln);
        end
    end
    println("Part one: ", tot_rec);
    println("Part one: ", tot_rec_strict);
end
main()
