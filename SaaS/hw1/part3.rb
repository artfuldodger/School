# HINT: you can quickly tell if two words are anagrams by sorting their # letters, keeping in mind that upper vs lowercase doesn't matter
def combine_anagrams(words)
  word_hash = words.inject({}) do |word_hash, word|
    sorted_word = word.downcase.split('').sort.join('')
    word_hash[sorted_word] ||= []
    word_hash[sorted_word] << word
    word_hash
  end
  word_hash.values.map(&:sort).to_a
end