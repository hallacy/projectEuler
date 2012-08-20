gridSize = 1001
runSum = 1
for i in 3..gridSize
    unless i % 2 == 0 
        puts i
        runSum += (i**2)*2.5+((i-2)**2)*1.5
    end
end
puts runSum
