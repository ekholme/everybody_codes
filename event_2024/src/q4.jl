using Statistics

# Part 1 ------------
inp_file = "event_2024/data/q4_1.txt"

inp = readlines(inp_file)
x = parse.(Int, inp)

y = minimum(x)
p1 = sum(x .- y)

# Part 2 -----------

function calculate_strikes(x::Vector{String})
    y = parse.(Int, x)

    m = minimum(y)
    r = sum(y .- m)
    return r
end

inp_file2 = "event_2024/data/q4_2.txt"
inp2 = readlines(inp_file2)

p2 = calculate_strikes(inp2)

# Part 3 -----------

function calculate_median_strikes(x::Vector{String})
    y = parse.(Int, x)

    m = median(y)
    d = abs.(y .- m)
    r = sum(d)
    return r
end

inp_file3 = "event_2024/data/q4_3.txt"
inp3 = readlines(inp_file3)

p3 = calculate_median_strikes(inp3)
