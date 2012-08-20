# recursively find the next value in a group that not used yet
def findSequence(mHash, prefix)
    if $sequence.length == 6
        if prefix.to_s == $sequence['triangle'].to_s[0,2]
            return true
        end
    else
        prefixNums = availableNumbers(mHash, prefix)
        prefixNums.each do |key, value|
            value.each do |entry|
                $sequence[key] = entry
                if findSequence(mHash, entry % 100)
                    return true
                else
                    $sequence.delete(key)
                end
            end
        end
    end
    return false
end

def availableNumbers(mHash, prefix)
    keys = $sequence.keys
    prefixNums = {}
    mHash.each do |key,value|
        value.each do |entry|
            unless $sequence.key? key 
                if entry.to_s[0,2] == prefix.to_s
                    if prefixNums.key? key
                        prefixNums[key] << entry
                    else
                        prefixNums[key] = [entry]
                    end
                end
            end
        end
    end
    return prefixNums
end

# First, find all 4 digit numbers for each category
mHash = {}
mHash['triangle'] = []
mHash['square'] = []
mHash['pentagonal'] = []
mHash['hexagonal'] = []
mHash['heptagonal'] = []
mHash['octagonal'] = []

n = 0
#triangle
while true
    n += 1
    newNum = n * (n + 1) / 2
    if newNum.to_s.length < 4
        next
    elsif newNum.to_s.length > 4
        break
    else
        mHash['triangle'] << newNum
    end
end

n = 0
while true
    n += 1
    newNum = n * n
    if newNum.to_s.length < 4
        next
    elsif newNum.to_s.length > 4
        break
    else
        mHash['square'] << newNum
    end
end

n = 0
while true
    n += 1
    newNum = n * (3*n - 1) / 2
    if newNum.to_s.length < 4
        next
    elsif newNum.to_s.length > 4
        break
    else
        mHash['pentagonal'] << newNum
    end
end

n = 0
while true
    n += 1
    newNum = n * (2*n - 1)
    if newNum.to_s.length < 4
        next
    elsif newNum.to_s.length > 4
        break
    else
        mHash['hexagonal'] << newNum 
    end
end

n = 0
while true
    n += 1
    newNum = n * (5*n - 3) / 2
    if newNum.to_s.length < 4
        next
    elsif newNum.to_s.length > 4
        break
    else
        mHash['heptagonal'] << newNum
    end
end

n = 0
while true
    n += 1
    newNum = n * (3*n - 2)
    if newNum.to_s.length < 4
        next
    elsif newNum.to_s.length > 4
        break
    else
        mHash['octagonal'] << newNum
    end
end

$sequence = {}

# walk once over triangle.  One of the numbers must be there
mHash['triangle'].each do |triangleNum|
    $sequence['triangle'] = triangleNum
    if (findSequence(mHash, triangleNum % 100))
        break
    else
        $sequence.delete('triangle')
    end

end
    puts $sequence.inspect
    sum = 0
    $sequence.each do |key,value|
        sum += value
    end
    puts "sum: #{sum}"


