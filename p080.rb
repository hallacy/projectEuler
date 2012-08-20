maxVal=99

runSum = 0
for i in 1..maxVal
puts runSum
    if Math.sqrt(i).to_i == Math.sqrt(i)
        next
    end
    # So the number isn't a square.  Lets implement the manual sqaure root algorithm
    firstDigit = Math.sqrt(i).to_i.to_s.chars.to_a[0].to_i
    puts "curNum: #{i}"
    puts "firstDigit: #{firstDigit}"
    pairs = []
    numString = i.to_s()
    if numString.size % 2 == 1
        numString = "0" + numString
    end
    for j in 0..numString.size / 2 - 1
        pairs << numString[j*2,2]
    end
    #pairs of number seperated out
    decimal = ""
    radicand = pairs[0].to_i - firstDigit**2
    pairsIndex = 0
    while decimal.size <= 100  
        pairsIndex += 1
        #puts "radicand: #{radicand}"
        curPairs = pairs[pairsIndex]
        if curPairs.nil?
            curPairs = "00"
        end
        radicand = (radicand.to_s + curPairs).to_i
        #puts "radicand: #{radicand}"
        bigSomething = (2*(firstDigit.to_s + "" + decimal).to_i).to_s
        smallSomething = 1
        while smallSomething*(bigSomething.to_s + "" + smallSomething.to_s).to_i < radicand
            smallSomething += 1
        end
        smallSomething -= 1
        #puts "smallSomething: #{smallSomething}"
        decimal += smallSomething.to_s
        #puts "fullDecimal so far: #{decimal}"
        radicand -= smallSomething*(bigSomething.to_s + "" + smallSomething.to_s).to_i
    end
    runSum += firstDigit
    puts "fullDecimal: #{firstDigit}.#{decimal}"
    for i in 0..98
        #puts "adding: #{decimal.chars.to_a[i]}, index: #{i}"
        runSum += decimal.chars.to_a[i].to_i
    end
end
puts runSum
