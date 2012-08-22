maxVal = 8
p = Array.new(maxVal+1,1)
phi = Array.new(maxVal+1),1
for i in 0..maxVal 
    phi[i] = i
end
p[0]=false
p[1]=false
start = Time.now
for i in 2..maxVal
    #puts i
    if p[i]
        phi[i] = i - 1
        j = 2
        while (i*j < maxVal + 1)
            p[i*j] = false
            phi[i*j] = phi[i*j]/i*(i-1)
            j += 1
        end
    end
end
result = 0
for i in 2..maxVal
    result += phi[i]
end
endTime = Time.now
puts result
puts start - endTime
