puts "Здравствуйте, эта программа определяет равносторонний, равноюедренный или прямоугольный треугольник."
puts "Пожалуйста введите стороны треугольника"
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f
if a==b && b==c 
    puts "Треугольник равносторонний"
elsif a==b || b==c || c==a
    puts "Треугольник равнобедренный"
end
if (a>b && a>c && (b**2+c**2)==a**2) || (b>a && b>c && (a**2+c**2)==b**2) || (c>b && c>a && (a**2+b**2)==c**2)
    puts "Треугольник прямоугольный" 
else 
    puts "Треугольник не прямоугольный!"
end