def rad(a)
    
    primeFactors = findPrimeFactors(a)
    #puts "in rad: " + primeFactors.inspect
    product = 1
    primeFactors.each do |entry|
        product *= entry
    end
    return product
end

def findPrimeFactors(a)
    input = a
    primeFactors = []
    while true
        found = 0
        #if $primeHash.key? a
        #    primeFactors.concat($primeHash[a])
        #    break
        #end
        for i in 2..Math.sqrt(a).floor       
            if a % i == 0
                found = 1
                    #puts "before: " + primeFactors.inspect
                unless primeFactors.include? i
                    #puts "added: " + primeFactors.inspect
                    primeFactors << i
                end
                a = a/i
                break
            end
        end
        if found == 0
            #puts "before: #{a}"
            unless primeFactors.include? a
                #puts "added: " + primeFactors.inspect
                primeFactors << a
            end
            a = 1
        end
        if a == 1
            break
        end
    end
    #puts "endFind: " + primeFactors.inspect
    #$primeHash[input] = primeFactors
    return primeFactors
end

maxVal = 100000

for i in 1..maxVal
    puts "#{rad(i)},#{i}"
end
