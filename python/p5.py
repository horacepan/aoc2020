import pdb

def get_col(s):
    lo = 0
    hi = (2 ** len(s)) - 1

    for c in s:
        if c == 'R': # upper
            lo = (lo + hi + 1) // 2
        else:
            hi = (lo + hi) // 2

    if s[-1] == 'R':
        return hi
    else:
        return lo

def get_row(s):
    lo = 0
    hi = (2 ** len(s)) - 1

    for c in s:
        if c == 'B': # upper
            lo = (lo + hi + 1) // 2
        else:
            hi = (lo + hi) // 2

    if s[-1] == 'B':
        return hi
    else:
        return lo

def get_id(line):
    row = get_row(line[:-3])
    col = get_col(line[-3:])
    return (row * 8) + col

def main():
    fname = '../data/p5.txt'

    with open(fname, 'r') as f:
        lines = f.readlines()
        max_id = 0
        max_line = None
        ids = []
        for line in lines:
            line = line.strip()
            sid = get_id(line)
            ids.append(sid)

            if sid > max_id:
                max_id = sid
                max_line = line

        print("Part one:", max_id)
        vals = sorted(ids)
        for idx, i in enumerate(vals):
            if idx > 0:
                if i - vals[idx - 1] > 1:
                    print("Part two:", i - 1)

if __name__ == '__main__':
    main()

