wordlist = ["poo", "dog", "pen", "hat", "cat", "rails"]
combinations = ARGV[0].dup.chars.to_a.permutation.map &:join

combinations.each do |com|
  if wordlist.include?(com)
    puts wordlist[wordlist.index(com)]
  end    
end
