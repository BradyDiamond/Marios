require 'rails_helper'

describe "create admin, sign up and add products" do

before :each do
  current_user = User.create({email: "user@test.com", password: "password", admin: true})
  testproduct = Product.create({name: "testproduct", cost: 9, country_of_origin: "USA"})
end




    it 'takes the user to the homepage where they can create an account' do
      visit '/'
      click_on('register')
      fill_in('Email', :with => 'user@email.com')
      fill_in('Password', :with => 'password')
      fill_in('Password confirmation', :with => 'password')
      click_button('Sign up')
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
    
    it 'takes the user to the homepage where they can create an account but not create product' do
      visit '/'
      click_on('register')
      fill_in('Email', :with => 'user@email.com')
      fill_in('Password', :with => 'password')
      fill_in('Password confirmation', :with => 'password')
      click_button('Sign up')
      expect(page).not_to have_content('Create new product')
    end

    it 'takes the user to the homepage where they can view and create reviews but not create or edit product' do
      visit '/'
      click_on('register')
      fill_in('Email', :with => 'user@email.com')
      fill_in('Password', :with => 'password')
      fill_in('Password confirmation', :with => 'password')
      click_button('Sign up')
      click_button('Coffees')
      within("#coffee-menu") do
        click_link('Testproduct')
      end
      expect(page).to have_content('Add a review')
      expect(page).not_to have_content('Create new product')
      expect(page).not_to have_content('Edit')
      expect(page).not_to have_content('Delete')
      click_link('Add a review')
      fill_in('Author', :with => 'Mr Cappy Barra')
      fill_in('Content body', :with => 'Accusamus veniam consequatur. Corrupti distinctio.')
      fill_in('Rating', :with => 1)
      click_button('Create Review')
      expect(page).to have_content('Mr Cappy Barra')
      expect(page).to have_content('Review successfully posted!')
    end

  describe 'the admin sign in path', {:type => :feature} do
    it 'takes the admin to the homepage and creates a product' do
      visit '/'
      click_on('sign in')
      fill_in('Email', :with => 'user@test.com')
      fill_in('Password', :with => 'password')
      click_button('Log in')
      click_link('Create new product')
      fill_in('Name', :with => 'test coffee')
      fill_in('Cost', :with => 5)
      fill_in('Country of origin', :with => 'COL')
      click_button('Create Product')
      click_button('Coffees')
      within("#coffee-menu") do
        click_link('Test Coffee')
      end
      expect(page).to have_content('Test Coffee')
    end
 
    describe 'the admin crud functionality', {:type => :feature} do
      it 'takes the admin to the homepage and adds review' do
      visit '/'
      click_on('sign in')
      fill_in('Email', :with => 'user@test.com')
      fill_in('Password', :with => 'password')
      click_button('Log in')
      click_button('Coffees')
      within("#coffee-menu") do
        click_link('Testproduct')
      end
      expect(page).to have_content('Add a review')
      click_link('Add a review')
      fill_in('Author', :with => 'Mr Cappy Barra')
      fill_in('Content body', :with => 'Accusamus veniam consequatur. Corrupti distinctio.')
      fill_in('Rating', :with => 1)
      click_button('Create Review')
      expect(page).to have_content('Mr Cappy Barra')
      expect(page).to have_content('Review successfully posted!')
      end

      describe 'the admin crud functionality', {:type => :feature} do
        it 'takes the admin to the homepage and edits product' do
          visit '/'
          click_on('sign in')
          fill_in('Email', :with => 'user@test.com')
          fill_in('Password', :with => 'password')
          click_button('Log in')
          click_button('Coffees')
          within("#coffee-menu") do
            click_link('Testproduct')
          end
  
          click_link('Edit')
          fill_in('Name', :with => 'New coffee')
          fill_in('Cost', :with => 5)
          fill_in('Country of origin', :with => 'COL')
          click_button('Update Product')
          expect(page).to have_content('New Coffee')
        end

        describe 'the admin crud functionality', {:type => :feature} do
          it 'takes the admin to the homepage and deletes product' do
            visit '/'
            click_on('sign in')
            fill_in('Email', :with => 'user@test.com')
            fill_in('Password', :with => 'password')
            click_button('Log in')
            click_button('Coffees')
            within("#coffee-menu") do
              click_link('Testproduct')
            end
            click_link('Delete')
            expect(page).to_not have_content('Testproduct')
          end
        end
      end
    end
  end
end
