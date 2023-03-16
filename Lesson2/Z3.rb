array =[0, 1]
until array.last>100
    array<< array.last+array[-2]    
end
array.pop
puts array