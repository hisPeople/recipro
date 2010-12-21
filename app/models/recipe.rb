# == Schema Information
# Schema version: 20101220195326
#
# Table name: recipes
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  preptime    :integer
#  cooktime    :integer
#  ingredients :text
#  directions  :text
#  servings    :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Recipe < ActiveRecord::Base
  attr_accessible :title, :preptime, :cooktime, :ingredients, :directions, :servings

  belongs_to :user
  
  validates :title, :presence => true, :length => { :maximum => 255 }
  validates :preptime, :presence => true
  validates_numericality_of :preptime
  validates :cooktime, :presence => true
  validates_numericality_of :cooktime
  validates :ingredients, :presence => true
  validates :directions, :presence => true
  validates :servings, :presence => true
  validates_numericality_of :servings
  validates :user_id, :presence => true
  
  default_scope :order => 'recipes.created_at DESC'
end
