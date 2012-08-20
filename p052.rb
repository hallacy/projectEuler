curNum = 0
found = 0
zeros=0
while found == 0
    curNum += 1 
    if Integer(curNum.to_s().chars.to_a[0]) > 1
        zeros += 1
        curString = "1"
        for i in 0..zeros
            curString += "0"
        end
        curNum = Integer(curString)
        next
    end
    puts curNum
    numArray = []
    numArray << curNum.to_s().chars.to_a.sort.join()
    found = 1
    print "match on: "
    for i in 2..6
        tempNum = curNum * i
        tempSort = tempNum.to_s().chars.to_a.sort.join()
        if numArray.include? tempSort
            print i
        else
            found = 0
            print "\n"
            break
        end
    end
end
print "\n"

    
