maxVal = 10000000

mArray = Array.new(1000, 0)
mArray[1] = 1
mArray[89] = 89
fraction = 0
found89 = 0
for i in 1..maxVal
  if i % (maxVal / 100).floor == 0
    puts fraction += 1
    #puts mArray.length
  end
  #puts "on: #{i}"
  curVal = i
  curPath = []
  found = 0
  while found == 0
    #puts "path: #{curPath}"
    unless curVal.to_s.length > 3
    if mArray[curVal] == 1
      found = 1
      curPath.each do |entry|
        mArray[entry] = 1
      end
    elsif mArray[curVal] == 89
      found = 1
      curPath.each do |entry|
        mArray[entry] = 89
      end    
      found89 += 1
    end
    end
    nextVal = 0
    curVal.to_s.chars.to_a.each do |digit|
      nextVal += (Integer(digit)) ** 2
    end
    curVal = nextVal
    unless curVal.to_s.length > 3
      curPath << curVal
    end
  end
end

puts found89