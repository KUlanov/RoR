puts "Здравствуйте, эта программа определяет корни квадратного уравнения вида ax2 + bx + c = 0."
puts "Пожалуйста введите коэффициенты уравнения."
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f
diskr= b**2 -4*a*c
if diskr>0
    puts "Дискриминант =#{diskr}"
    puts "X1=#{(-b+Math.sqrt(diskr))/(2*a)} X2=#{(-b-Math.sqrt(diskr))/(2*a)}"
elsif diskr==0
    puts "Дискриминант =#{diskr}"
    puts "X=#{(-b)/(2*a)}"
else puts"Корней нет!"
end