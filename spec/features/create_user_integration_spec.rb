require 'rails_helper'

describe 'the user creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create an account' do
    visit '/'
    click_on('register')
    fill_in('Email', :with => 'user@email.com')
    fill_in('Password', :with => 'password')
    fill_in('Password confirmation', :with => 'password')
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end


describe 'the user sign in path', {:type => :feature} do
  it 'takes the signed in  user to the homepage' do
    visit '/'
    click_on('sign in')
    fill_in('Email', :with => 'user@email.com')
    fill_in('Password', :with => 'password')
    click_button('Log in')
    # click_on('Coffees')
    select 'CT', from: "Coffees"
    find(:css, '#dropdownMenuButton1').click_on(".a_different_dropdown")
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end

# describe 'the user sign in path', {:type => :feature} do
#   current_user = User.create({email: "user@test.com", password: "password", admin: true})

#   product = Product.create({name: "product", cost: 9, country_of_origin: "USA", id:10})

#   review = Review.create({product_id: product.id, author: "gary", content_body: "Reiciendis quo in. Delectus vero sapiente. Conseq.", rating: 1})
  

#   it 'takes the signed in  user to the homepage' do
#     visit '//products/1'rail
#     click_on('Add a review')
#     fill_in('Email', :with => 'user@email.com')
#     fill_in('Password', :with => 'password')
#     click_button('Log in')
#     # click_on('Coffees')
#     select 'CT', from: "Coffees"
#     find(:css, '#dropdownMenuButton1').click_on(".a_different_dropdown")
#     expect(page).to have_content('Welcome! You have signed up successfully.')
  # end
# end