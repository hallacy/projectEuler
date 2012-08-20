triangleCur = 286
pentCur = 165
while true
    triangleVal = triangleCur*(triangleCur+1)/2
    pentVal = pentCur*(3*pentCur-1)/2

    puts "triangleCur: #{triangleCur}"
    puts "pentCur: #{pentCur}"   

    if triangleVal == pentVal && triangleVal % 2 == 1
        puts "curVal: #{pentVal}"
        break
    elsif triangleVal < pentVal
        triangleCur += 1
    else
        pentCur += 1
    end
end
