def prime_sieve_upto(n)
  all_nums = (0..n).to_a
  all_nums[0] = all_nums[1] = nil
  all_nums.each do |p|
    #jump over nils
    next unless p
    #stop if we're too high already
    break if p * p > n
    #kill all multiples of this number
    (p*p).step(n, p){ |m| all_nums[m] = nil }
  end
  #remove unwanted nils
  all_nums.compact
end

starting = Time.now
amount = 1000000
primes = prime_sieve_upto(amount)

maxLength = primes.size

#figure out what the worst case maxlength is
sum = 0
for i in 0..primes.size - 1
    sum += primes[i]
    if sum > primes[primes.size - 1]
        maxLength = i
        break
    end
end

#start from the longest and find a consecutuve list
found = 0
while found == 0
    puts maxLength
    sum = 0

    starting = Time.now
    for i in 0..maxLength - 1
        sum += primes[i]
    end
    ending = Time.now
    puts "Time taken for sum: " + (ending - starting).to_s()

        #find nearest prime
        nearPrime = primes[0]
        marker = 0
        #we'll walk down the prime list so we only read it once
        while sum > nearPrime
            marker += 1
            nearPrime = primes[marker]
        end 
        if nearPrime == sum
            puts sum
            found = 1
            puts primes[0,maxLength].join(",")
        end
        starting = Time.now

        # we only want to read the primes list once here as well
        # so we add the new element and subtract the old
        for j in 0..(primes.size - maxLength)


            sum -= primes[j]
            sum += primes[maxLength + j]

            if sum > primes[primes.size - 1]
                break
            end
            while nearPrime < sum
                marker += 1
                nearPrime = primes[marker]
            end
            if nearPrime == sum

                puts primes[j+1,maxLength].join(",")
                puts sum
                found = 1
            end
        end
        ending = Time.now
        puts "Time taken for march: " + (ending - starting).to_s()

    maxLength -= 1

end
