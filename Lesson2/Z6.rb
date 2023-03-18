basket = {}
loop do
    puts "ВВедите <стоп> или <stop> в наименовании товара, если хотите выйти:"    
    print "ВВедите наименование товара:"
    d=gets.chomp
    break if d == "стоп" or d == "stop"
    print "ВВедите цену за еденицу товара:"
    price=gets.chomp.to_f
    print "ВВедите количество това:"
    coint=gets.chomp.to_f
    summ_i=price*coint
    puts "Цена за #{d} , в количестве #{coint}= #{price*coint} "
    basket[d] = [price, coint]
end
summ = 0
basket.each {
     |i, value|
     summ += value[0] * value[1]
   }
puts "Сумма всех покупок: #{summ}"