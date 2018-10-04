Given /^the following movies exist:$/ do |table|
  table.hashes.each do |hash|
	  Movie.create hash
  end
end

Then /^the director of "(.*)" should be "(.*)"$/ do |movie_name, director_val|
  movie = Movie.find_by_title(movie_name)
  expect(movie.director).to eq director_val
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(',').each do |rating|
    field = "ratings_#{rating.strip}"
    if uncheck
      uncheck field
    else
      check field
    end
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  body = page.body
  loc_of_e1 = body.index(e1)
  loc_of_e2 = body.index(e2)
  loc1 = loc_of_e1
  loc2 = loc_of_e2
  if loc1==nil || loc2 == nil
    fail "One of both search parameters not found"
  else
    expect(loc1<loc2).to eq true
  end
end