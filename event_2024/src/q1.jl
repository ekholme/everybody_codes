# Part 1 --------------
inp_file = "event_2024/data/q1_1.txt"
inp = readline(inp_file)

vals = split(inp, "")

function recode_val(x::AbstractString)
    return x == "A" ? 0 : x == "B" ? 1 : 3
end

p1 = sum(recode_val.(vals))

# Part 2 ------------
inp2 = readline("event_2024/data/q1_2.txt")
n_pairs = length(inp2) ÷ 2

pv = Vector{String}(undef, n_pairs)
evens = 2:2:2000

for i in evens
    k = i ÷ 2
    j = i - 1
    pv[k] = inp2[j:i]
end

function score_val2(x::AbstractString)
    return x == "A" ? 0 : x == "B" ? 1 : x == "C" ? 3 : x == "D" ? 5 : 0
end

function score_pair(x::AbstractString)
    s = split(x, "")
    scores = sum(score_val2.(s))
    if !occursin("x", x)
        scores += 2
    end
    return scores
end

p2 = sum(score_pair.(pv))

# Part 3 ---------------

