puts "Здравствуйте! Как вас зовут?"
name=gets.chomp
puts"#{name}, введите ваш рост в сантиметрах?"
height=gets.chomp.to_i
if height>=110
    puts "Ваш идеальный вес равен #{((height-110)*1.15).round(2)}"
else 
    puts"Ваш вес идеален!"
end