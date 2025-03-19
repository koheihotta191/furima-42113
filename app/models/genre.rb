class Genre < ActiveHash::Base
  self.data = [
   
  ]
 
   include ActiveHash::Associations
   has_many :articles
 
  end