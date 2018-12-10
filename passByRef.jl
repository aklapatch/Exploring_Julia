mutable struct uct
    var
end

function test(var)
    var = 3
    return
end

function uctTest(input::uct)
    input.var = 3
    return
end

test_uct = uct(4)
println("Before uctTest $(test_uct.var)")
uctTest(test_uct)
println("After uctTest $(test_uct.var)")

input_arg = 42
println("Before test $input_arg")
test(input_arg)
println("After test $input_arg")