function get_nums()
    fname = "../data/p1.txt";
    word_nums = readlines(fname);
    nums = map(x->parse(Int, x), word_nums);
    return nums;
end

function part_one(nums)
    nums = Set(nums);

    for n in nums
        if in(2020 - n, nums)
            println("Part one: ", n * (2020 - n));
            return;
        end

        push!(nums, n);
    end
end

function part_two(nums)
    two_sums = Set();

    for n1 in nums
        for n2 in nums
            for n3 in nums
                if (n1 + n2 + n3) == 2020
                    println("Part two: ", n1 * n2 * n3);
                    return;
                end
            end
        end
    end
end

function main()
    nums = get_nums();
    part_one(nums);
    part_two(nums);
end

main();
