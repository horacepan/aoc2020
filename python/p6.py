def group_uniques(group):
    qs = set()

    for l in group:
        qs = qs.union(set(l))

    return len(qs)

def all_group_uniques(group):
    qs = None

    for l in group:
        if qs is None:
            qs = set(l)
        else:
            qs = qs.intersection(set(l))
    return len(qs)

def main():
    fname = '../data/p6.txt'

    with open(fname, 'r') as f:
        lines = f.read().splitlines()
        curr_group = []
        tot = 0
        tot_unique = 0

        for l in lines:
            if len(l) == 0:
                tot += group_uniques(curr_group)
                tot_unique += all_group_uniques(curr_group)
                curr_group = []
            else:
                curr_group.append(l)

        print("Part one: ", tot)
        print("Part one: ", tot_unique)

if __name__ == '__main__':
    main()
