# Exploring Julia
Exploration of the Julia language for CSCI 355

[Full Proposal](https://drive.google.com/open?id=1zAACVJXP2G_ECGt8eHKT_1zGMPDgzC5JwPi9xr1OOBM)

## Progress

So far I am just playing with the language and following the beginners documentation to see what some of the language features are.

### Language features so far

 + Package manager

 + Perl's print and string syntax

```julia
first="One small step for man"
last="One giant leap for mankind"
println("$first\n$last")
```

Result:

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/perlCodeResult.png)

 + Python's command line

![alt text](https://raw.githubusercontent.com/aklapatch/explore-julia/master/images/juliaCMDExample.png)

### Train of thought

Julia's heritage of other languages leads to a interesting side effect. Juila carries Perl's "There is more than one way to do it." mentality. Since many mechanisms are in place from other languages, this results in many ways to accomplish a task. One example of this is declaring a function.

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


