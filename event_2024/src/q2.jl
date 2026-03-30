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

## Part 2 -----

mutable struct PuzzleInput2
    Keywords::Vector{String}
    PuzzleLines::Vector{String}
end

function PuzzleInput2(x::Vector{String})
    k = extract_keywords(x[1])
    v = x[3:end]
    return PuzzleInput2(k, v)
end

# count runes forward and backward
# note that 'runes' is language from the problem -- we're *not* actually counting Julia runes
function count_runes_f_b(needle::String, haystack::Vector{String})
    rgx = Regex(needle)
    n = length(haystack)
    res = Vector{Integer}(undef, n)

    for i in eachindex(haystack)
        m_forward = length(collect(eachmatch(rgx, haystack[i], overlap=true)))
        m_backward = length(collect(eachmatch(rgx, reverse(haystack[i]), overlap=true)))

        res[i] = m_forward + m_backward
    end

    return sum(res)
end

function solve_p2(x::PuzzleInput2)
    l = length(x.Keywords)
    res = Vector{Integer}(undef, l)

    for i in eachindex(x.Keywords)
        res[i] = count_runes_f_b(x.Keywords[i], x.PuzzleLines)
    end

    return sum(res)
end

inp_file_2 = "event_2024/data/q2_2.txt"
inp2 = readlines(inp_file_2)

pi2 = PuzzleInput2(inp2)

a2 = solve_p2(pi2)
# ok, so this is currently wrong.
# i'm counting the number of matches, but what I actually want is the number of unique characters that are part of a match
# i'm not going to fix it now, but good to know for later :)