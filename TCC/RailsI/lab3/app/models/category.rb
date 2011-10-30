class Category < ActiveRecord::Base
  validates :name, :presence => true

  belongs_to :parent_category, 
             :class_name => 'Category'
  
  has_many :sub_categories,
           :class_name => 'Category',
           :foreign_key => 'parent_category_id'

  has_many :books
end
