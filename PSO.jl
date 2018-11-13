#PSO example in julia
mutable struct particle
    pos::Float64
    fitness::Float64
    bpos::Float64
    bfit::Float64
    v::Float64
end

bestpos = 0.0
bestfit = -1000000.0

part_arr = Array{particle}(undef,100)
for i in 1:100
    part_arr[i] = particle(i,-1000000.0,0.0, -1000000.0, 0.0)
end

fitness(x) = -(x-3)^2

# evaluate and find best spot
for i in 1:1:100
    global bestfit  # YOU HAVE TO DO THAT
    global bestpos  # WHY?

    for j in 1:1:100

        # evaluate fitness
        part_arr[j].fitness = fitness(part_arr[j].pos)

        if(part_arr[j].fitness > part_arr[j].bfit)
            part_arr[j].bfit = part_arr[j].fitness
            part_arr[j].bpos = part_arr[j].pos
        end

        if(part_arr[j].fitness > bestfit)

            bestfit = part_arr[j].fitness
            bestpos = part_arr[j].pos
        end

        part_arr[j].v = .7*part_arr[j].v + .6*(rand(0:100)/100)*(part_arr[j].bpos - part_arr[j].pos) + .492*(rand(0:100)/100)*(bestpos - part_arr[j].pos)
    end

    for j in 1:1:100
        if(part_arr[j].fitness > part_arr[j].bfit)
            part_arr[j].bfit = part_arr[j].fitness
            part_arr[j].bpos = part_arr[j].pos
            
            if(part_arr[j].fitness >  bestfit)
                bestfit = part_arr[j].fitness
                bestpos = part_arr[j].pos
            end
        end
    end
end
println("bestpos = ",bestpos, " bestfit= ", bestfit)
