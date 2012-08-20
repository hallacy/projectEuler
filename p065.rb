#Generate Euler pattern
commandArray = Array.new(98,1)
numArray = [2,3]
demArray = [1,1]
for i in 0..32
    commandArray[3*i] = 2+2*i
end

for i in 0..commandArray.length - 1
    if commandArray[i] == 1 
        numArray[i] = numArray[i - 1] + numArray[i - 2]
        demArray[i] = demArray[i - 1] + demArray[i - 2]
    else
        numArray[i] = numArray[i - 1]*commandArray[i] + numArray[i - 2]
        demArray[i] = demArray[i - 1]*commandArray[i] + demArray[i - 2]  
    end
    puts "next fraction is: #{numArray[i]}/#{demArray[i]}"
end

lastNum = numArray.last
sum = 0
lastNum.to_s.chars.to_a.each do |digit|
    sum += digit.to_i
end
puts "sum: #{sum}"
