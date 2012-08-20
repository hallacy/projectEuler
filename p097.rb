powers2 = []
curNum = 2
resolution = 6
while !powers2.include? curNum
    #puts powers2.size
    powers2 << curNum
    curNum *= 2
    #truncate to last 10 digits
    #puts "curnum: #{curNum}"
    if curNum.to_s.chars.to_a.size < resolution
        length = curNum.to_s.chars.to_a.size
        curNum = curNum.to_s[-length,length].to_i
    else
        curNum = curNum.to_s[-resolution,resolution].to_i
    end
end

#calculate nonrepeating and repeating length
index = powers2.index(curNum)
puts "non-repeating length: #{index}"
puts "repeating length: #{powers2.length - index}"

keyVal = 7830457
keyVal -= index
puts "mod: #{keyVal % (powers2.length - index)}"
keyVal = keyVal % (powers2.length - index)
puts "resulting power2: #{powers2[keyVal + index - 1]}"
result = (powers2[keyVal + index - 1] * 28433) + 1
result = result.to_s[-10,10].to_i
puts "result #{result}"
#puts powers2

#Notice that the length of each repeating sequence is 5* the resolution below it
# and that the non-repeating length increases by 1 each resolution
# we can thus figure out the exact power of two we need (7830457 mod (12500*5^4))
result = ((2**17957).to_s[-10,10].to_i * 28433) + 1
result = result.to_s[-10,10].to_i
puts "result #{result}"
#puts powers2
