regexp = []
regexp << /"(.*)",\s*"(.*)"/
regexp << /"([^"]+)",\s*"([^"]+)"/
regexp << /(.*),\s*(.*)/
regexp << /"(.*)", "(.*)"/
 
movies = [%q{"Aladdin",   "G"},
          %q{"I, Robot", "PG-13"},
          %q{"Star Wars","PG"}]

regexp.each do |r|
  puts "regexp = #{regexp}"
  movies.each do |movie|
    movie.match(r)
    title,rating = $1,$2
    # puts "title = #{title} rating = #{rating}"
  end
end

class C

end


class B < C

end


class A < B

end

a = A.new
b = B.new
c = C.new

# puts "a.superclass == b.superclass = #{a.superclass == b.superclass}"
puts "b.respond_to?('class') = #{b.respond_to?('class')}"
puts "a.class.ancestors.include?(C) = #{a.class.ancestors.include?(C)}"
puts "A.superclass == B = #{A.superclass == B}"