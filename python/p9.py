import pdb
from collections import deque

def add_new():
    pass

def get_answer(nums, k=25):
    vals = []
    psums = []

    for ind, x in enumerate(nums):
        vals.append(x)
        psums.append(set())

        found = False
        # update past 25 stuff
        for i in range(1, min(ind, k) + 1):
            idx = ind - i
            if x in psums[idx]:
                found = True

            # these we still want
            other = vals[idx]
            psums[idx].add(other + x)

        if ind >= k and not found:
            print(f"Part one: {x}")
            break

def get_contiguous(nums, val):
    '''
    Find contiguous sequence in nums that sums to val
    '''
    rolling_sums = []
    rvals = []
    start_idx = 0

    for idx, x in enumerate(nums):
        # add x to all rolling sums starting from the start_idx
        rvals.append([])
        rolling_sums.append(0)
        for i in range(start_idx, idx + 1):
            rolling_sums[i] += x
            rvals[i].append(x)
            if rolling_sums[i] == val:
                print("Part two:", min(rvals[i]) + max(rvals[i]))
                return

def main():
    fname = '../data/p9.txt'
    with open(fname, 'r') as f:
        lines = [int(x.strip()) for x in f.readlines()]
        get_answer(lines, 25)
        val = 393911906
        get_contiguous(lines, val)

if __name__ == '__main__':
    main()
    contents = [
          35
        , 20
        , 15
        , 25
        , 47
        , 40
        , 62
        , 55
        , 65
        , 95
        , 102
        , 117
        , 150
        , 182
        , 127
        , 219
        , 299
        , 277
        , 309
        , 576
    ]
