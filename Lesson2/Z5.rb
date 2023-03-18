months = { 1=>31, 2=>28, 3=>31, 4=>30, 5=>31, 6=>30, 7=>31, 8=>31, 9=>30, 10=>31, 11=>30, 12=>31}
puts "Эта программа вычисляет порядковый номер В году даты введенной вами!"
print "ВВедите число:"
d=gets.chomp.to_i
print "ВВедите месяц:"
m=gets.chomp.to_i
print "ВВедите год:"
y=gets.chomp.to_i
num = d
if y%4 == 0
    months[2]=29 
    months[2]=28 if y%100 == 0 and y%400!=0
end
(1 ... m).each do |i|
            num += months[i] 
end
puts "Порядковый номер даты в году: #{num}"