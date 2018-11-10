struct test
        obj1
        obj2
end

t1 = test(3,4)

println("t1.obj1 = ",t1.obj1," t1.obj2 = ",t1.obj2)

test(x) = test(x,x)

test() = test(0)

println("test(0).obj1 = ",test().obj1)

# specify data types
struct pt
    y::Int64
end

println("pt(0).y= ",pt(0).y)

# specify input arguments
struct Point{T<:Real}
    x::T
    y::T
    Point{T}(x,y) where {T<:Real} = new(x,y) 
      
end


println("distance (1,1)=",Point{Float64}(1.2,1.2))

