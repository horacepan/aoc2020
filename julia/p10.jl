using DataStructures

function compute(lines)
    sort!(lines);
    d1 = 0;
    d2 = 0;
    d3 = 0;
    prev = lines[1];

    for i in 2:length(lines)
        val = lines[i];
        if  val - prev == 1
            d1 += 1;
        elseif val - prev == 2
            d2 += 1;
        elseif val - prev == 3
            d3 += 1;
        end

        prev = val;
    end
    d3 += 1;
    println("Part 1: $(d1 * d3)")
end

function get_ways(nums)
    sort!(nums, rev=true);
    ways = DefaultDict(0);
    max_volt = maximum(nums);
    ways[max_volt + 3] = 1;

    for n in nums
        ways[n] = ways[n + 1] + ways[n + 2] + ways[n+3];
    end
    println("Part two: ", ways[0]);
end

function main()
    fname = "../data/p10.txt";
    lines = readlines(fname);
    lines = map(y->parse(Int, y), lines);

    push!(lines, 0);
    compute(lines);
    get_ways(lines);
end

main()
