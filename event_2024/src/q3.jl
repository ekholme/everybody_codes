# Quest 3

## Part 1 ------------

inp_file = "event_2024/data/q3_1.txt"
inp = readlines(inp_file)

function input_to_matrix(x::Vector{String})
    n = length(x[1])
    m = length(x)

    mat = zeros(Int, m, n)

    for i ∈ 1:m
        y = split(x[i], "") .== "#"
        mat[i, :] = y
    end

    return mat
end

x = input_to_matrix(inp)

function find_neighbors(x, v)
    idx = findall(i -> i == v, x)
    l = length(idx)

    out = Vector{Bool}(undef, l)

    for i ∈ eachindex(idx)
        xind = idx[i][1]
        yind = idx[i][2]

        z = (
            (CartesianIndex(xind + 1, yind) ∈ idx) &&
            (CartesianIndex(xind - 1, yind) ∈ idx) &&
            (CartesianIndex(xind, yind + 1) ∈ idx) &&
            (CartesianIndex(xind, yind - 1) ∈ idx)
        )

        out[i] = z
    end

    return idx[out]
end

function find_neighbors_iter(x, start_v=1)
    b = true
    v = start_v
    while b
        idx = find_neighbors(x, v)
        l = length(idx)
        if l == 0
            break
        end
        v += 1
        x[idx] .= v
    end
    return x
end

zzz = find_neighbors_iter(x)
p1 = sum(zzz)