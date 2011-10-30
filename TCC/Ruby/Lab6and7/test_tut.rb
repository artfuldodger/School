require_relative 'tut'
require 'test/unit'

class TestTut < Test::Unit::TestCase
  def setup
  end
  
  def test_is_tut
    # Empty string is tut
    assert Tut.is_tut("")
    
    # Test tut is tut
    assert Tut.is_tut "Wutowut! Lutookut atut tuthutisut gutetut cutonutvuteruttutedut tuto Tututut!"
    
    # Test english is not tut
    assert !Tut.is_tut( "This is an English sentence.")
  end
  
  def test_to_tut_without_block
    # Test english gets translated to tut when asked
    assert_equal "Wutowut! Lutookut atut tuthutisut gutetut cutonutvuteruttutedut tuto Tututut!", Tut.to_tut( "Wow! Look at this get converted to Tut!" )
    # Test you get nil when you try to translated tut to tut
    assert_equal nil, Tut.to_tut("Wutowut! Lutookut atut tuthutisut gutetut cutonutvuteruttutedut tuto Tututut!")
  end
  
  def test_to_tut_with_block
    # Test english gets translated to tut with a block
    return_string = ''
    Tut.to_tut( "Wow! Look at this get converted to Tut!" ) { |c| return_string += c }
    assert_equal "Wutowut! Lutookut atut tuthutisut gutetut cutonutvuteruttutedut tuto Tututut!", return_string
    
    # Test empty strings come back empty
    return_string = ''
    Tut.to_tut( "" ) { |c| return_string += c }
    assert_equal "", return_string
  end
  
  def test_to_english_without_block
    assert_equal "Wow! Look at this get converted to Tut!", Tut.to_english( "Wutowut! Lutookut atut tuthutisut gutetut cutonutvuteruttutedut tuto Tututut!" )
    assert_equal nil, Tut.to_english("Wow! This is already English!" )
  end
  
  def test_to_english_with_block
    # Test tut gets translated to english with a block
    return_string = ''
    Tut.to_english( "Wutowut! Lutookut atut tuthutisut gutetut cutonutvuteruttutedut tuto Tututut!" ) { |c| return_string += c }
    assert_equal "Wow! Look at this get converted to Tut!", return_string
    
    # Test empty strings come back empty
    return_string = ''
    Tut.to_english( "" ) { |c| return_string += c }
    assert_equal "", return_string
  end
end