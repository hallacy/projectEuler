class Fixnum
  def gcd(y)
    x=self
    while y!=0 do
      r = x%y;
      x = y;
      y = r;
    end
    return x
  end
end

$findTime = 0
def rad(a,b,c)
    
    findStart = Time.now
    primeFactors = findPrimeFactors(a).concat(findPrimeFactors(b)).concat(findPrimeFactors(c))
    #puts "in rad: " + primeFactors.inspect
    findEnd = Time.now
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

sum = 0
hits = 0

maxVal = 120000
for c in 2..maxVal

    cStart = Time.now
    radTTime = 0
    gcdTime = 0
    compTime = 0
$findTime = 0
    for b in (c/2).ceil..c - 1

        #comparison
        compStart = Time.now
        a = c - b
        compEnd = Time.now
        compTime += compEnd - compStart

        #gcd
        gcdStart = Time.now
        unless c.gcd(b) == 1 && b.gcd(a) == 1 && c.gcd(b) == 1
            next
        end
        gcdEnd = Time.now
        gcdTime += gcdEnd - gcdStart
    #puts c
        #product
        radStart = Time.now
        if rad(a,b,c) < c
            puts "#{a},#{b},#{c}"
            
            puts "adding: #{c}"
            sum += c
            hits += 1
        end
        radEnd = Time.now
        radTTime += radEnd - radStart

    end
    cEnd = Time.now 
    #puts "findTime: #{$findTime}"
    #puts "compTime: #{compTime}"
    #puts "gcdTime: #{gcdTime}"
    #puts "radTTime: #{radTTime}"
   # puts "cTime: #{cEnd - cStart}"
end
puts "sumC: #{sum}, numC: #{hits}"

