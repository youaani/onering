require 'model'

class Contact < App::Model::Base
  include App::Model::Taggable
  
  set_collection_name "contacts"
  
  many :contacts

  key :name,            String
  key :tags,            Array

end