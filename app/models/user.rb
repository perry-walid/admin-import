class User < ApplicationRecord
  # # include Devise::JWT::RevocationStrategies::JTIMatcher
  # # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # # devise :database_authenticatable, :rememberable, :jwt_authenticatable, jwt_revocation_strategy: self,  authentication_keys: [:username] 

  # validates :username, presence: true, uniqueness: true


  # enum role: { admin: 'admin', user: 'user' }
end
