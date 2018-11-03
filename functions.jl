function g(x)
    2*x
end
# print result
number = g(2)
println("g(2)=",number)

# functions are values
f(y) = y^3

println("f(3)=",f(3))

#specify return type
function h(three)::Float16
    three * 42
    three / 6
end
println("h(7)=",h(7))

#operators are functions
println("+(7,8,3)=",+(7,8,3))
k = +
println("k = + \n k(7,8,3)=",k(7,8,3))

# nameless functions (compiler makes name)
z -> z^2 - 2*z

function (t)
    t*4 + t^(1/2)
end

# using the nameless function
println("map(w-> w^(1/2) - w^2, [3,4,1,6])=",map(w-> w^(1/2) - w^2, [3,4,1,6]))

#supports immutable tuples 
tup = ("fish", 7, "chicken")
println("tup = ", tup)

#named tuple
tup = (a = 4, b = 25)
println("tup.a = ",tup.a)

#assigning tuples
y,x = tup
println("x = ",x," y = ",y)

#variable args has to be three dots 
tupl(y,z,arg...) = (y, z, arg)
println("tupl of 4 5 2 3 1 3 4 = ",tupl(4, 5, 2, 3, 1, 3, 4))

# specify data type
function test(x,y,z=3)
    3*x - 1*y +z
end
println("test(1,1)=",test(1,1))
