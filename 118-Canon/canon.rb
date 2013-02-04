n, a, b, c = ARGV[0].to_f, ARGV[1].to_f, ARGV[2].to_f, ARGV[3].to_f
load_time = [a,b].max + c
fire_time = [a,b,c].max
fired = 0
elapsed_time = load_time
while elapsed_time < n do
  fired += 1
  elapsed_time += fire_time
end
puts fired
