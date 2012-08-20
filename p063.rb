# base numbers can only be 1-9, so lets loop over them
count = 0
for i in 1..9
    exp = 0
    while true
        exp += 1
        expNum = i ** exp
        expLength = expNum.to_s.length
        if expLength > exp
            next
        elsif expLength < exp
            break
        else
            count += 1
        end
    end
end
puts count
