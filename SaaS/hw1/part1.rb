def palindrome?(phrase)
  phrase = phrase.downcase.gsub(/\W/, '')
  phrase.reverse == phrase
end

def count_words(string)
  words = string.gsub(/\W/,' ').downcase.split(/ /).reject { |x| x.empty? }
  words.inject({}) { |word_counts, word| word_counts[word] = (word_counts[word] || 0) + 1; word_counts }
end