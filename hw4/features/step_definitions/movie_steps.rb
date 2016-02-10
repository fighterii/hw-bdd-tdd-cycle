Given /the following movies exist:/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    
    Movie.create!(movie)
  end
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |movie, director|
    #debugger
    page.should have_content(director)
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  #page.body.include?("(.*)e1(.*)e2(.*)")
  match = /.*#{e1}.*#{e2}/m =~ page.body
  match == nil ? (fail "Wrong Order") : true
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(',').each do |rating|
  #debugger
    if uncheck then
      step("I uncheck \"ratings_#{rating}\"")
    else 
      step("I check \"ratings_#{rating}\"")
    end
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  #
  movies_count = Movie.all.length
  #debugger
  #expect(page).to have_selector('tr', :count == movies_count)  #
  #page.should page.has_selector?('tr', :count == movies_count) 
  page.all('table#movies tr').count.should == movies_count + 1
end