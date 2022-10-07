class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

# julio = User.create(name: 'Julio', photo: 'url', bio: 'Developer', postscounter: 5)
