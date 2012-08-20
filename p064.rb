maxVal=10000

#We use the thm from 
# http://books.google.com/books?id=9FAR-0A5tJgC&pg=PA39&lpg=PA39&dq=length+of+repeating+block+in+periodic+fractions&source=bl&ots=mU6ZuqCEFb&sig=37ooA0ji9wHL1pnbqP_RWnE6gz4&sa=X&ei=aPwvUKvTEaiUigLN9YFo&ved=0CCcQ6AEwAg#v=onepage&q=length%20of%20repeating%20block%20in%20periodic%20fractions&f=false

#Thm 5
# that says that the last digit in the repeated sequence will be twice that of the starting value
oddPeriodCount = 0
for i in 2..maxVal
    if Math.sqrt(i).to_i == Math.sqrt(i)
        next
    end
    puts "CurNum: #{i}"
# implement http://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Example.2C_square_root_of_114_as_a_continued_fraction
    m = 0
    d = 1
    periodLength = 0
    a0 = Math.sqrt(i).floor
    a = a0
    puts "ao: #{a0}"
    while a != a0 * 2
        m = d*a - m
        d = (i - m**2)/d
        a = Float((a0+m)/d).floor
        puts "a: #{a}"
        periodLength += 1
    end
    if periodLength % 2 == 1
        oddPeriodCount += 1
        puts "added to count"
    end
end
puts oddPeriodCount
