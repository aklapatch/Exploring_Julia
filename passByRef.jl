mutable struct TestType
    var
end

function test(var)
    var = 3
    return
end

function structTest(input::TestType)
    input.var = 3
    return
end

test_struct = TestType(4)
println("Before structTest $(test_struct.var)")

structTest(test_struct)
println("After structTest $(test_struct.var)")

input_arg = 42
println("Before test $input_arg")

test(input_arg)
println("After test $input_arg")