#pulled from   https://docs.julialang.org/en/v1/manual/interfaces/

struct Squares
    size::Int
end

Base.iterate(S::Squares,state = 1) = state > S.size ? nothing : (state*state,state+1)

for i in Squares(9)
    println(i)
end

