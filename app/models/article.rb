class Article < ActiveRecord::Base
  
  #validation input data
  validates :title, presence: true, length: {minimum: 5}
  
end
