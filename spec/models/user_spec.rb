require 'spec_helper'

describe User do
  
  before(:each) do
    @user = Factory(:user)
    @attr = { :title => "Some nachos",
              :preptime => "2",
              :cooktime => "2",
              :ingredients => "tortilla chips
              shredded cheese",
              :directions => "Turn your oven on to broil.
  Place a piece of aluminum foil to cover a cookie sheet.
  Spread chips out on the tinfoil, you want them overlapping so the cheese can help them stick together.
  Sprinkle cheese over the chips. You can do as much or as little as you would like.
  Stick the cookie sheet with your nachos into the oven, the rack should make it so your nachos are near the broiler.
  Turn the oven light on.
  With the oven light on keep a close eye on the progress of your nachos, broil in oven until the cheese is melted and bubbling but not so long that the chips have started to burn.
  Take your nachos out of oven (don't forget to turn off the oven :o ).
  You probably don't need to let them cool too much, in fact enjoy them immediately after removing them from the oven to ensure maximum nom nom nomibility",
              :servings => "1"}
  end
  
  describe "recipe associations" do
    
    before(:each) do
      @user = User.create(@attr)
      @recipe1 = Factory(:recipe, :user => @user, :created_at => 1.day.ago)
      @recipe2 = Factory(:recipe, :user => @user, :created_at => 1.hour.ago)
    end
    
    it "should have a recipes attribute" do
      @user.should respond_to(:recipes)
    end
    
    it "should have the right recipes in the right order" do
      @user.recipes.should == [@recipe2, @recipe1]
    end
    
    it "should destroy associated recipes" do
      @user.destroy
      [@recipe1, @recipe2].each do |recipe|
        Recipe.find_by_id(recipe.id).should be_nil
      end
    end
  end
  
  describe "validations" do
    
    it "should require a user id" do
      Recipe.new(@attr).should_not be_valid
    end
    
    it "should require nonblank title" do
      @user.recipes.build(:title => "    ").should_not be_valid
    end
    
    it "should reject long title" do
      @user.recipes.build(:title => "a" * 256).should_not be_valid
    end
    
    it "should reject empty preptime" do
      @user.recipes.build(:preptime => " ").should_not be_valid
    end
    
    it "should reject empty cooktime" do
      @user.recipes.build(:cooktime => "").should_not be_valid
    end
    
    it "should require nonempty ingredients" do
      @user.recipes.build(:ingredients => "    ").should_not be_valid
    end
    
    it "should require nonempty directions" do
      @user.recipes.build(:directions => " ").should_not be_valid
    end
    
    it "should reject empty servings" do
      @user.recipes.build(:servings => "    ").should_not be_valid
    end
  end
end
