require	"digest/sha2"

class User < ActiveRecord::Base
  attr_accessible :cas_id, :name, :hashed_password
  
  belongs_to  :stu_books

  def User.authenticate(cas_id, password) 
    if user = User.find_by_cas_id(cas_id)
      if user.hashed_password == entrypt_password(password)
	user
      end
    end
  end
  
  def User.entrypt_password(password)
    Digest::SHA2.hexdigest(password + "kgtong")
  end
  
  
  
end
