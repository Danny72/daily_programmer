dic = {:'['=>'p',:'{'=>'P',:':'=>'L',:';'=>'l',:'<'=>'M',:','=>'m',p:'o',
       o:'i',i:'u',u:'y',y:'t',t:'r',r:'e',e:'w',w:'q',l:'k',k:'j',j:'h',h:'g',
       g:'f',f:'d',d:'s',s:'a',m:'n',n:'b',b:'v',v:'c',c:'x',x:'z',:" "=>' '}

def shift(input,dic)
  input.split('').map { |char| (char=~/^[A-Z]$/)?(dic[char.to_sym.downcase].upcase):(dic[char.to_sym])}.join('') 
end

puts shift('Lmiyj od ,u jrtp',dic)
puts shift('Jr;;p Ept;f',dic)
