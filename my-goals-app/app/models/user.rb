# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    

    validates_presence_of :username
    validates_presence_of :password_digest
    validates_presence_of :session_token
    # validates :username, uniqueness: true 
    # validates :sesison_token , uniqueness: true 
    # validates :password, length: {minimum: 6}, allow_nil: true 

    attr_reader :password 

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end 

    def create 
        user = User.new(user_params)
        @user.save!
        
    end 
    

    private 
    def user_params 
        params.require(:user).permit(:username,:password)
    end 
end 
