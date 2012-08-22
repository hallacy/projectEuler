bouncyCount = 0
curNum = 99
while Float(bouncyCount) / curNum < 0.99
  curNum += 1
  firstD = curNum.to_s[0,1]
  increase = false
  decrease = false
  for i in 1..curNum.to_s.length - 1
    secondD = curNum.to_s[i,1]
    if secondD > firstD
      increase = true
    elsif secondD < firstD
      decrease = true
    end
    firstD = secondD
  end
  if increase && decrease
    bouncyCount += 1
  end
    #puts "curnum: #{curNum}, bouncyCount: #{bouncyCount}, percent: #{Float(bouncyCount) / curNum}"

end    
puts "curnum: #{curNum}, bouncyCount: #{bouncyCount}, percent: #{Float(bouncyCount) / curNum}"
