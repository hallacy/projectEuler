rootNum = 600851475143
primeFactors = []

while true
    found = 0
    for i in 1..Math.sqrt(rootNum).floor
        if rootNum % i == 0
            found = 1
            puts i
            rootNum = rootNum/i
        end
    end
    if found == 0
        puts rootNum
        break
    end
    if rootNum == 1
        break
    end
end

