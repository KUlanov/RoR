a=0
gl={}
for i in ("a".."z") do
    a+=1
    if ["a", "e", "i", "o", "u", "y"].include? i
      gl[i]= a
    end
end
pp gl