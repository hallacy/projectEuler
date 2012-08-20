cubeSHash = {}
cubeUHash = {}
count = 0
while true
    count += 1
    if count % 10000 == 0
        print "*"
    end
    cubeSort = (count ** 3).to_s.chars.to_a.sort.to_s
    puts cubeSort
    if cubeSHash.key? cubeSort
        cubeSHash[cubeSort] += 1
        puts "num: #{count} hit #{cubeSHash[cubeSort]}"
        if cubeSHash[cubeSort] == 5
            puts "result: #{cubeUHash[cubeSort]}"
            break
        end
    else
        cubeSHash[cubeSort] = 1
        cubeUHash[cubeSort] = (count ** 3)
    end            
end

