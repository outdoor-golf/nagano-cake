class Address < ApplicationRecord
<<<<<<< HEAD
  belongs_to :customer
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end
=======
  belongs_to:customer
>>>>>>> origin/develop
end
