
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


```julia
function abs(x); (x^2)^(1/2); end
```


## Gripes and Nitpicks

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

To access the global variables you declared earlier, you need to specify that they want to access that variable. The problem is that that specification (the `global bestfit` statement) looks like you are declaring a global variable. This could be confusing. It would be better to have this syntax.  
```julia
global var_name = value
```
In my opinion, there is a universal, better solution. One could use descriptive variable names.
```julia
global_var_name = value
```
This how I think they came to that syntax. One designer wanted to have the ability to have variables with the same names in different scopes. This could be usedful in scientific computing since certian variable names (x for example) are commonly used. 

Someone probaly came up with the `global var_name = value` syntax, but thought that it would be more efficient to have one specification at the beginning of the scope.

The problem is that feature promotes bad practice, and negatively impacts readability, writeability, and reliability. 

It decreases readability since it becomes harder to determine which variable is being access. It worsens reliability because it becomes harder to predict which instance will be accessed. The writability is made worse since the developer has to add this specification to every applicable change in scope. 



