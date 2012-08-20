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

#Handle right edge and bottom edge first to avoid exceptions
sumGrid[grid.length - 1][grid.length - 1] = grid[grid.length - 1][grid.length - 1]

for i in 0..grid.length - 2
    sumGrid[grid.length - 1][grid.length - 2 - i] = sumGrid[grid.length - 1][grid.length - 1 - i]
    sumGrid[grid.length - 1][grid.length - 2 - i] += grid[grid.length - 1][grid.length - 2 - i]
end

for i in 0..grid.length - 2
    sumGrid[grid.length - 2 - i][grid.length - 1] = sumGrid[grid.length - 1 - i][grid.length - 1]
    sumGrid[grid.length - 2 - i][grid.length - 1] += grid[grid.length - 2 - i][grid.length - 1]
end

for i in 0..grid.length - 2
    for j in 0..grid.length - 2
        sumGrid[grid.length - 2 - i][grid.length - 2 - j] = 
            [sumGrid[grid.length-1-i][grid.length-2-j],sumGrid[grid.length-2-i][grid.length-1-j]].min
        sumGrid[grid.length - 2 - i][grid.length - 2 - j] += grid[grid.length - 2 - i][grid.length - 2 - j]
    end
end

puts "result: #{sumGrid[0][0]}"
=begin
grid.each do |line|    
    puts line.inspect
end
puts
sumGrid.each do |line|    
    puts line.inspect
end
=end
