
An exploration of the Julia programming language for CSCI 355

[Full Proposal](https://drive.google.com/open?id=1zAACVJXP2G_ECGt8eHKT_1zGMPDgzC5JwPi9xr1OOBM)

## Progress

So far I am playing with the language and following the beginner's documentation to get some knowlegde of the language and its features.

### Language features so far

 + Package manager

 + Build system

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
  
![alt text](../images/juliaMetaProg.png)

Constructing an expression:
![alt text](../images/juliaAssignExpr.png)

+ External program execution, manipulation and interoperability:

![alt text](../images/juliaExtProg.png)

+ Bash style variable interpolation:

![alt text](../images/juliaExtVars.png)



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
