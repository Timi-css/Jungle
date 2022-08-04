require 'rails_helper'

RSpec.describe User, type: :model do
  subject {User.new(first_name: 'Test', last_name: 'User', email: 'user@test.com', password: '123', password_confirmation: '123'   ) }
  describe 'Validations' do
    it "should not validate without password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'should not validate wihtout password_confirmation' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it 'should not validate without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should not validate without an first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'should not validate without an last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'should not validate if password is less than 3 characters' do
      subject.password = 'do'
      subject.password_confirmation = "do"
      expect(subject).to_not be_valid
    end
 end
 describe '.authenticate_with_credentials' do
  it 'should validate if email has spaces before or after' do
    subject.save
    @user = User.authenticate_with_credentials(' user@test.com ', '123')
    expect(@user).to_not be_nil
  end
  it 'should authenticate if email case is wrong' do
    subject.save
    @user = User.authenticate_with_credentials('USER@TEST.com', '123')
    expect(@user).to_not be_nil
  end
  
end
end
