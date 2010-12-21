require 'spec_helper'

describe UsersController do

describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
    end

    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
    
    it "should show the user's recipes" do
      recipe1 = Factory(:recipe, :user => @user, 
      :title => "Broiler Style Nachos",
      :preptime => "2",
      :cooktime => "2",
      :ingredients => "Tortilla chips
  Cheese",
      :directions => "Turn your oven on to broil.
  Place a piece of aluminum foil to cover a cookie sheet.
  Spread chips out on the tinfoil, you want them overlapping so the cheese can help them stick together.
  Sprinkle cheese over the chips. You can do as much or as little as you would like.
  Stick the cookie sheet with your nachos into the oven, the rack should make it so your nachos are near the broiler.
  Turn the oven light on.
  With the oven light on keep a close eye on the progress of your nachos, broil in oven until the cheese is melted and bubbling but not so long that the chips have started to burn.
  Take your nachos out of oven (don't forget to turn off the oven :o ).
  You probably don't need to let them cool too much, in fact enjoy them immediately after removing them from the oven to ensure maximum nom nom nomibility",
      :servings => "1")
      
      recipe2 = Factory(:recipe, :user => @user, 
      :title => "Ballpark style Nachos",
      :preptime => "0",
      :cooktime => "0",
      :ingredients => "Tortilla chips
  Cheese",
      :directions => "Go to a ballpark.
      Find a vendor or concession area selling ballpark style Nachos.
      Buy ballpark style Nachos.
      Enjoy",
      :servings => "1")
      get :show, :id => @user
      response.should have_selector("span.content", :title => recipe1.title, :cooktime => recipe1.cooktime, :preptime => recipe1.preptime, :ingredients => recipe1.ingredients, :directions => recipe1.directions, :servings => recipe1.servings)
      response.should have_selector("span.content", :title => recipe2.title, :cooktime => recipe2.cooktime, :preptime => recipe2.preptime, :ingredients => recipe2.ingredients, :directions => recipe2.directions, :servings => recipe2.servings)
    end
end


  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

end
