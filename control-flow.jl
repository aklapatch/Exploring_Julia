#compound expressions
z = begin x=1; y=2; x+y end
println("compound expressions z = ",z)

z = (x = 4; y = 2; x*y)
println("compound expressions z = ",z)

println("compound expressions z = ", (x=4;y=2;x^y))

# if 
if (4 > 3)
    println("four is > 3")
end

# if else
if( 3>4)

else 
    println("3 is not > 4")
end

# if else if
if ( false)

elseif (true)
    println("it's true, isn't it?")
end


var = 2

#if elseif else
if ( 7 < var)
    println("var > 7")
elseif ( var < 7)
    println(" var < 7")
else
    println("var = 7")
end