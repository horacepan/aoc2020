def eval_password(line):
    tokens = line.split(' ')
    [_min, _max] = tokens[0].split('-')
    _min = int(_min)
    _max = int(_max)
    letter = tokens[1][0]
    password = tokens[2]
    cnt = 0

    for c in password:
        if c == letter:
            cnt += 1
    return _min <= cnt and cnt <= _max

def eval_password2(line):
    tokens = line.split(' ')
    [_min, _max] = tokens[0].split('-')
    _min = int(_min) - 1
    _max = int(_max) - 1
    letter = tokens[1][0]
    password = tokens[2]

    return (password[_min] == letter and password[_max] != letter) or \
           (password[_min] != letter and password[_max] == letter)

def main():
    f = open('../data/p2.txt', 'r')
    tot = 0

    for line in f.readlines():
        tot += eval_password2(line)
    print(tot)

if __name__ == '__main__':
    main()
