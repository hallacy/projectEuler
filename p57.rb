numerator = 1
denominator = 1 
moreDigits = 0
for i in 1..1000
    numeratorold = numerator
    denominatorold = denominator
    numerator = numeratorold + denominatorold * 2
    denominator = numeratorold + denominatorold
    if numerator.to_s.chars.to_a.size > denominator.to_s.chars.to_a.size
        moreDigits += 1
        puts "next fraction is #{numerator}/#{denominator}"
    end
end
puts "total: #{moreDigits}"
