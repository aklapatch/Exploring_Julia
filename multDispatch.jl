
println(string(1))
println(string(3.564))

max_val(var::Int32) = 2^31 -1

max_val(var::Int16) = 2^15-1

function main()
    arg1::Int16 = 2
    arg2::Int32 = 2

    println("before max_val arg1 = $arg1 arg2= $arg2")

    arg1 = max_val(arg1)
    arg2 = max_val(arg2)

    println("after max_val arg1 = $arg1 arg2= $arg2")
end

main()