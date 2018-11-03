# print functions
print("Using basic ")
print("print function.\n")

# defining string variables, and using numbers
str = "Value is: "
val = 32
println(str,val)

# print ascii value of a character
println("ASCII value of b = ",Int('b'))

println("Truth value of Int('7') == 7: ",Int('7') == 7)

#convert between cases
str_caps = uppercase("lowercase letters")
str_lower = lowercase("UPPERCASE LETTERS")

println(str_caps)
println(str_lower)

#string indexing
str = "Test string."

#print raw value
show(str[4]); println()

#make substring
show(str[5:end]); println()

# string interpolation
val = "value "
str = "reading"
println("$str a $val")

#evaluation expressions in strings
println("73 + 32 = $(72+32)")

#string concatenation
str = "Testing " * " string " * "concatenation "
println(str)

# string function
str = string("this ", "is ", "another ", "test")
println(str)

#string literal
str = """ using triple quotes
can give you    
a string     literal """
println(str)

