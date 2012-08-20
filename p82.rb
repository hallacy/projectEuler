matrixFile = File.open("matrix.txt")
grid = []
matrixFile.each do |line|
    grid << line.chomp.split(",").collect{|i| i.to_i}
end


puts grid.length
#initialize sumGrid
sumGrid = []
for i in 0..grid.length - 1
    sumGrid << Array.new(grid.length,0)
end

grid.each do |line|    
    puts line.inspect
end

#Handle right edge first to avoid exceptions

(grid.length - 1).downto(0) { |i| 
    sumGrid[i][grid.length - 1] = grid[i][grid.length - 1]
}

#iterate over each column, going right, then top, then down to find the min for that space
(grid.length - 2).downto(0) { |i|
    for j in 0...grid.length
        #right
        sumGrid[j][i] = sumGrid[j][i + 1]
        sumGrid[j][i] += grid[j][i]
    end
    #top
    for j in 1..grid.length - 1
        sumGrid[j][i] = [sumGrid[j - 1][i] + grid[j][i],sumGrid[j][i]].min
    end
    #bottom
    (grid.length - 2).downto(0) { |j| 
        sumGrid[j][i] = [sumGrid[j + 1][i] + grid[j][i],sumGrid[j][i]].min
    }
}


puts
sumGrid.each do |line|    
    puts line.inspect
end

min = sumGrid[0][0]
for i in 0..grid.length - 1
    unless min < sumGrid[i][0]
        min = sumGrid[i][0]
    end
end
puts "min: #{min}"

