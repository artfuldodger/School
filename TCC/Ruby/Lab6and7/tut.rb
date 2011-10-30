class Tut
  alpha_lower = ('a'..'z')
  alpha_upper = ('A'..'Z')
  vowels = %w{a e i o u A E I O U}
  ConsonantsLower = alpha_lower.reject { |v| vowels.include? v }
  ConsonantsUpper = alpha_upper.reject { |v| vowels.include? v }
  # Have to convert ranges to arrays to combine as far as I can tell
  Consonants = ConsonantsLower.to_a + ConsonantsUpper.to_a

  def self.to_tut( line )
    is_not_already_tut = !is_tut( line )
    translated_line = ''
#    puts "line: #{line}"
#    puts "is_not_already_tut: #{is_not_already_tut}"
    
    line.each_char do |char|
      if is_not_already_tut
        if Consonants.include? char
          char = char + 'ut'
        end
      end
      yield char if block_given?
      translated_line += char
    end
    
    return nil if not block_given? and not is_not_already_tut
    return translated_line if not block_given?
  end

  def self.to_english( line )
    translated_line = ''
    is_really_tut = is_tut( line )
#    puts "line: #{line}"
#    puts "is_really_tut: #{is_really_tut}"
#    puts is_really_tut
    
    # need to keep track of characters since the last consonant so we skip the 'ut'
    if is_really_tut
      chars_since_consonant = 2
      line.each_char do |char|
        chars_since_consonant += 1
        if chars_since_consonant > 2
          if block_given?
            yield char
          end
          translated_line += char
        end
        
        if Consonants.include? char and chars_since_consonant > 2 # don't detect the "t" in "ut"
          chars_since_consonant = 0
        end
      end
    else
      line.each_char do |char|
        yield char if block_given?
        translated_line += char
      end
    end
    
    return nil if not block_given? and not is_really_tut
    return translated_line if not block_given?
  end
  
  def self.is_tut( line )
    line =~ /^(([aeiou ])|([bcdfghjklmnpqrstvwxyz]ut)|[[:punct:]])*$/i
  end
end

=begin
Tut.to_tut( "Wow! Look at this get converted to Tut!" ) { |c| print c }
# should outout : Wutowut! Lutookut atut tuthutisut gutetut cutonutvuteruttutedut tuto Tututut!
puts
puts

tut = Tut.to_tut( "Wow! Look at this get converted to Tut!" )
puts "from return: #{tut}"

puts

Tut.to_tut(  ) { |c| print c }
# should outout : Wutowut! Lutookut atut tuthutisut gutetut cutonutvuteruttutedut tuto Tututut!
puts
puts

tut = Tut.to_tut( "Wutowut! Lutookut atut tuthutisut gutetut cutonutvuteruttutedut tuto Tututut!" )
puts "from return: #{tut}"

puts

tut_string = ""
Tut.to_tut( "I'm in tut but I want to be in english." ) { |c| tut_string += c }
puts tut_string
# should output : I'mut inut tututut bututut I wutanuttut tuto bute inut enutgutlutisuthut.

puts

Tut.to_english( tut_string ) { |c| print c }
# should output : I'm in tut but I want to be in english.
=end