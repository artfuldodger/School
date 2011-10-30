class Tut
  alpha_lower = ('a'..'z')
  alpha_upper = ('A'..'Z')
  vowels = %w{a e i o u A E I O U}
  ConsonantsLower = alpha_lower.reject { |v| vowels.include? v }
  ConsonantsUpper = alpha_upper.reject { |v| vowels.include? v }
  # Have to convert ranges to arrays to combine as far as I can tell
  Consonants = ConsonantsLower.to_a + ConsonantsUpper.to_a

  def self.to_tut( line )
    line.each_char do |char|
      if Consonants.include? char
        char = char + 'ut'
      end
      yield char
    end
  end

  def self.to_english( line )
    # need to keep track of characters since the last consonant so we skip the 'ut'
    chars_since_consonant = 2
    line.each_char do |char|
      chars_since_consonant += 1
      yield char if chars_since_consonant > 2
      if Consonants.include? char and chars_since_consonant > 2 # don't detect the "t" in "ut"
        chars_since_consonant = 0
      end
    end
  end
end

Tut.to_tut( "Wow! Look at this get converted to Tut!" ) { |c| print c }
# should outout : Wutowut! Lutookut atut tuthutisut gutetut cutonutvuteruttutedut tuto Tututut!

puts ""

tut_string = ""
Tut.to_tut( "I'm in tut but I want to be in english." ) { |c| tut_string += c }
puts tut_string
# should output : I'mut inut tututut bututut I wutanuttut tuto bute inut enutgutlutisuthut.

Tut.to_english( tut_string ) { |c| print c }
# should output : I'm in tut but I want to be in english. 