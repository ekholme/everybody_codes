inp_file_1 = "event_2024/data/q5_1.txt"

inp1 = readlines(inp_file_1)

mutable struct DanceCol
    Column::Vector{Integer}
end

mutable struct Dance
    Columns::Vector{DanceCol}
end

function get_dance(x::Vector{String})
    n = length(x)
    tmp = Vector{Vector{Integer}}(undef, n)
    for i ∈ eachindex(x)
        tmp[i] = parse.(Int, split(x[i], " "))
    end
    m = reduce(vcat, tmp')

    ncol = size(m)[2]
    ret = Vector{DanceCol}(undef, ncol)
    for i ∈ eachindex(ret)
        ret[i] = DanceCol(m[:, i])
    end

    d = Dance(ret)
    return d
end

xxx = reduce(vcat, zzz')

dd = get_dance(inp1)
