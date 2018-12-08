function test(y::Real)
    if (y>20)
        return 1
    else
        return 0
    end
end

function main()
    t::Float32 = 34.34234
    x::Float64 = 34.34234
    
    println("val= ",test(t))
    println("val= ",test(x))
end

main()