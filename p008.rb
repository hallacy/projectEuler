#assume a < b < c
a = 0
b = 0

while true
    b += 1
    c = 1000 - a - b
    if b >= c
        a += 1
        b = a + 1

    end
    c = 1000 - a - b
    puts "A: #{a}, B: #{b}, C: #{c}"
    if c == 0
        break
    end
    if a**2 + b**2 == c**2
        print a*b*c
        break
    end
end
