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
require 'rails_helper'

RSpec.describe User, type: :model do
  
  user = User.create(username: "gyroboy", password: "password")

  

  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_presence_of(:session_token)}
  it {should validate_uniqueness_of(:username)}
  it {should validate_uniqueness_of(:session_token)}

  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals) }



  pending "add some examples to (or delete) #{__FILE__}"
end
 
