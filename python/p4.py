import pdb

VALID_KEYS = set([
    'byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid', 'pid', 'cid'
])
EYE_COLORS = set(['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'])

HAIR_CHARS = set(['a', 'b', 'c', 'd', 'e', 'f']).union(set([str(i) for i in range(0, 10)]))

def get_record(lines):
    rec = {}
    for l in lines:
        parts = l.split(" ")
        for frag in parts:
            idx = frag.index(":")
            key = frag[:idx]
            val = frag[idx + 1:]
            rec[key] = val
    return rec

def is_valid(rec):
    return len(rec) == 8 or (len(rec) == 7 and 'cid' not in rec)

def valid_byr(v):
    return len(v) == 4 and (1920 <= int(v) <= 2002)

def valid_iyr(v):
    return len(v) == 4 and (2010 <= int(v) <= 2020)

def valid_eyr(v):
    return len(v) == 4 and (2020 <= int(v) <= 2030)

def valid_hgt(v):
    if 'cm' in v and v[-2:] == 'cm':
        if v[:v.index('cm')].isnumeric():
            return 150 <= int(v[:v.index('cm')]) <= 193
        else:
            return False
    if 'in' in v and v[-2:] == 'in':
        if v[:v.index('in')].isnumeric():
            return 59 <= int(v[:v.index('in')]) <= 76

    else:
        return False

def valid_hcl(v):
    return v[0] == '#' and len(v) == 7 and all([c in HAIR_CHARS for c in v[1:]])

def valid_ecl(v):
    return v in EYE_COLORS

def valid_pid(v):
    return len(v) == 9

def valid_cid(v):
    return True

FUNCTION_DISPATCHER = {
    'byr': valid_byr,
    'iyr': valid_iyr,
    'eyr': valid_eyr,
    'hgt': valid_hgt,
    'hcl': valid_hcl,
    'ecl': valid_ecl,
    'pid': valid_pid,
    #'cid': valid_cid,
}


def is_valid_strict(rec):
    # for k in rec.keys():
    #     if k not in VALID_KEYS:
    #         return False
    #     else:
    #         # is properly i the dispatch
    #         f = FUNCTION_DISPATCHER[k]

    if (len(rec) == 8) or len(rec) == 7 and 'cid' not in rec:
        # loop over all keys
        for k, f in FUNCTION_DISPATCHER.items():
            if k != 'cid' and not (f(rec[k])):
                return False
        return True
    return False

def main():
    tot_recs = 0
    tot_recs_strict = 0
    with open('../data/p4.txt', 'r') as f:
        lines = f.readlines()
        records = []
        curr_line = []

        for l in lines:
            l = l.strip()
            if len(l) == 0:
                rec = get_record(curr_line)
                tot_recs += int(is_valid(rec))
                tot_recs_strict += int(is_valid_strict(rec))
                curr_line = []
            else:
                curr_line.append(l)

        print('Part one: {}'.format(tot_recs))
        print('Part two: {}'.format(tot_recs_strict))

if __name__ == '__main__':
    main()
