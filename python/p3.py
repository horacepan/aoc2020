import pdb

def solve(mat, dx, dy):
    rows = len(mat)
    cols = len(mat[0])
    loc_x = 0
    loc_y = 0
    ntrees = 0

    while 1:
        if loc_x < rows:
            ntrees += int(mat[loc_x][loc_y] == '#')
        else:
            break

        loc_x += dx
        loc_y = (loc_y + dy) % cols
    return ntrees

def main():
    fname = '../data/p3.txt'
    with open(fname, 'r') as f:
        mat = []
        for line in f.readlines():
            mat.append(line.strip())

        a1 = solve(mat, 1, 1)
        a2 = solve(mat, 1, 3)
        a3 = solve(mat, 1, 5)
        a4 = solve(mat, 1, 7)
        a5 = solve(mat, 2, 1)
        prod = a1 * a2 * a3 * a4 * a5
        print("Part one:", a2)
        print("Part two:", prod)

if __name__ == '__main__':
    main()
