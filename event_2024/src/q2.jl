# Quest 2
## Part 1

mutable struct PuzzleInput
    Keywords::Vector{String}
    PuzzleText::String
end

function extract_keywords(x::String, prefix::String="WORDS:")
    tmp = replace(x, prefix => "")
    ret = string.(split(tmp, ","))
    return ret
end

function PuzzleInput(x::Vector{String})
    k = extract_keywords(x[1])
    v = x[3]

    return PuzzleInput(k, v)
end

function count_matches(x::PuzzleInput)
    l = length(x.Keywords)
    res = Vector{Integer}(undef, l)

    for i in eachindex(x.Keywords)
        ri = Regex(x.Keywords[i])
        res[i] = length(collect(eachmatch(ri, x.PuzzleText, overlap=true)))
    end

    return sum(res)

end

inp_file_1 = "event_2024/data/q2_1.txt"
inp1 = readlines(inp_file_1)

pi1 = PuzzleInput(inp1)

a1 = count_matches(pi1)
