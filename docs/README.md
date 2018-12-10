
An exploration of the Julia programming language for CSCI 355

[Full Proposal](https://drive.google.com/open?id=1zAACVJXP2G_ECGt8eHKT_1zGMPDgzC5JwPi9xr1OOBM)

[Final Presentation](https://drive.google.com/open?id=17BncfvbCnx1tWT6wZLClORXZzMAlNDgpsIZt8X_L8bs)

# Main attributes

## Static or Dynamic compliation?

Julia is an interpreted language: compiled then run around the same time.

### Compilation exceptions

Julia code can be embedded in C code, linked to the julia library, and compiled with gcc. In addition, there is a Julia package called PackageCompiler that helps automate this process. However, when I tried this (on Windows with the mingw-w64 port of gcc), a simple hello world program program was over one hundred megabytes in size. Compilation also takes an unusually long time.

## Pass by Value?

Julia is pass by value as long as you are passing in a single primitive. values inside arrays and structs can be mutated, but structs and arrays cannot be reassigned to the input parameter. It is most similar to Java's pass by a copy of an object's reference.

A quick example:
```julia
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
```
That code outputs:

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/passByRef.png)

## Type checking 

Julia checks types at runtime. It can use the argument's types to determine which function should be called.

```julia
function f(x::Int,y::Int)
    # do integer stuff
end

function f(x,y)
    # do stuff
end
```

In this example the first version of the function `f` will be called if the arguments are integers, and the second function will be called if the arguments are not an integer or an integer subtype, like a bool type.

## Exception handling

Julia has a lot of builtin exceptions. Some examples follow:

```julia
ArgumentError
DomainError
OverflowError
BoundsError
OutOfMemoryError
```

Exceptions can be defined as such:
```julia
struct SpecialException <: Exception end
```

Exceptions  are triggered by using the `throw` keyword:
```julia
throw(OutOfMemoryError())
```

Julia uses try catch and finally blocks to handle exceptions:
```julia
try
    # try to do something

catch
    # do if an exception occurs

finally
    # this executes whether or
    # not an exception occurres
end
```

## Memory management

Memory is automatically managed, like most scripting languages.

## The Julia paradigm

Julia is not an OO language. It does not support objects per say. However, there are some leftover traits from OO programming. The main evidence of this is the subtyping feature.

One can declare a subtype of a primitive as such

```julia
primitive type Bool <: Integer 8 end
```

Julia also allows subtyping checks to evaluate to Bool values.

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/evalSubtype.PNG)

### Subtyping applied

Julia can uses this subtyping concept in its equivalent of C++ templates.

```julia
struct Vehicle{T}
    Type::T
    weight::Float64
    engine::String
    gun::String
end
```
One can check the subtyping of this struct as such:

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/subtypeStruct.PNG)

Julia uses multiple dispatch, so it does not consider any concrete type to be a subtype of another concrete type.

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/concreteSubtypes.PNG)

Even though:

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/FloatSubtype.PNG)

### Multiple Dispatch

In few words, multiple dispatch is runtime function overloading.

In more words, it selects a function at runtime based on the specified types. It will select the function based on the most concrete type. If you specify a supertype, it will accept all suptypes of that supertype.

```julia
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
```

Running that yields this result:

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/subSuperType.PNG)

#### Why Multiple Dispatch? (Why no objects?)

The main reasons I have found are simplicity and ease of extending existing code.

The most common example of this is implementing functions that could, in an object-oriented language, be bound to two different objects. 

One possible situation that exemplifies this is simulating a person starting a car.

In Julia that function could look like this.
```julia
function startCar(input_person::Person, input_car::Car)
    start(input_car)
end
```

Following an object oriented programming style, Java in this case, would have a function prototype like this
```java
public class Person {

    void startCar(Car input_car){
        input_car.start();
    }
}
```

While that may look all well and good, 


```julia
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
```





## Language features

+ Package manager

+ Build system (for packages)

+ Perl's print substitution

```julia
first="One small step for man"
last="One giant leap for mankind"
println("$first\n$last")
```

Code Result:

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/perlCodeResult.png)

+ Python's command line functionality

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/juliaCMDExample.png)

+ Meta Programming (Julia can access its own parser and symbols in the native language)

Parsing a string into a expression:
  
![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/juliaMetaProg.png)

Constructing an expression:

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/juliaAssignExpr.png)

+ External program execution, manipulation and interoperability:

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/juliaExtProg.png)

+ Bash style variable interpolation:

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/juliaExtVars.png)

+ Some matlab syntax and functions (Julia's arrays start at one)

```julia
for i in 2:2:100
    array[i] = array[i-1] + array[i]
end
```

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/MatSyntax.png)

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/MatFunc.png)

## Train of thought

Julia's heritage of other languages leads to a interesting side effect. Juila exemplifies Perl's "There is more than one way to do it." mentality. This effect results from Julia's varing syntaxes that were imported from other programming languages. One example of this is declaring a function.

All of the following methods are equivalent.

```julia
abs(x) = (x^2)^1/2;
```

```julia
function abs(x)
    (x^2)^(1/2)
end
```

```julia
function abs(x)
    return (x^2)^(1/2)
end
```

```julia
function abs(x); (x^2)^(1/2); end
```

The problem arises when Julia tries to buck the conventions of the languages that pulls features from. One example is that by default structs are immutable. A C programmer would not be used to that, and that would decrease writability for them since they have to make a transition to a new practice.

So far I have two examples of that. One of them is the defalut immutable struct, and the other is having to re-declare a global variable inside a local scope to acess that variable. While these might seem like minor nuances, they indicate that the Julia team is willing to depart from convention in ways that might not be helpful.

## Gripes and Nitpicks

### Incomplete support

The language does not universally support all of its features across all cases or scenarios.

One example is global variable typing.

```julia
global_var::Float32 = 34.5134
```

This results in:

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/typingGlobalVars.png)

### "Features"

#### Scope specification

The scope in julia has a unique mechanic involved in it. This design choice can be good for clarity, but it only if you know what it means. Here is an example.

```julia
bestpos = 0.0
bestfit = -1000000.0

# change in scope
for i in 1:1:100
    global bestfit  # YOU HAVE TO DO THAT. WHY?

    for j in 1:100
        if(stuff[j] > bestfit)
            bestfit = stuff[j];
        end
    end

    # do the rest of your stuff
end
```
If you omitted that `global bestfit` statement, you would encounter this error:

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/juliaGlobalError.png)

To access the global variables you declared earlier, you need to specify that they want to access that variable. The problem is that that the scope specification, this statement:
```julia
global bestfit
``` 
looks like a variable declaration. This could be confusing and decreases readability if you do not know what it is. 

In my opinion, there is a universal, better solution. One could use descriptive variable names.
```julia
global_var_name = value
```
This is a glaring issue because other languages do not have this "feature" and are fine without it. Julia could be made simpler without a significant consequence by omitting this feature.

#### Mutable structs

This how you declare an immutable struct:
```julia
struct fubar
    foxtrot::Int64
    uniform::UInt32
    bravo::Int8
end
```

This is how you declare a mutable struct:
```julia
mutable struct person
    age::Int8
    beliefs::String
end
```

This bucks the C convention, and if you are going to inherit from C, it is not a good principle to buck its convention. This makes it harder to transition from C to Juila.

It would be more C like to have an immutable struct declared as follows:

```julia
immutable struct example
    var1
    var2
end
```

References:
    <https://docs.julialang.org/en/v1/>
