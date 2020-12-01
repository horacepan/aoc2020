def main():
    fname = '../data/p1.txt'
    f = open(fname, 'r')

    nums = [int(l) for l in f.readlines()]
    num_set = set()

    for n in nums:
        if (2020 - n) in num_set:
            print('Part one: {}'.format(n * (2020 - n)))
            break
        num_set.add(n)

    pair_sums = {}
    for n1 in nums:
        for n2 in nums:
            pair_sums[n1 + n2] = (n1, n2)

    for n3 in nums:
        if (2020 - n3) in pair_sums:
            n1, n2 = pair_sums[2020 - n3]
            print("Part two: {}".format(n1 * n2 * n3))
            break

if __name__ == '__main__':
    main()
