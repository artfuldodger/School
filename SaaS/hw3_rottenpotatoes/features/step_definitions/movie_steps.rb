# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  # assert false, "Unimplmemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  regexp = Regexp.new ".*#{e1}.*#{e2}"
  assert = page.body =~ regexp, "Did not find #{e1} before #{e2}"
end

Then /I should see all of the movies/ do
  assert all("table#movies tbody tr").size == Movie.count, "Found #{all("table#movies tbody tr").size} movies"
end

Then /I should see no movies/ do
  assert all("table#movies tbody tr").size == 0, "Found #{all("table#movies tbody tr").size} movies"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  fields = rating_list.split(',').map(&:strip).map{ |rating| "ratings_#{rating}" }
  fields.each do |field|
    uncheck ? uncheck(field) : check(field)
  end

end
