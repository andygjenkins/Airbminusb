require 'spec_helper'

describe User do
  subject {User.create(first_name: 'Bob', surname: 'Smith', email: 'bob@mail.com')}

  describe '#name' do
    it 'has a name' do
      expect(subject.first_name).to eq 'Bob'
    end
  end

  describe '#surname' do
    it 'hsa a surname' do
      expect(subject.surname).to eq 'Smith'
    end
  end

  describe '#email'do
    it 'has and email' do
      expect(subject.email).to eq 'bob@mail.com'
    end

    it 'has a unique email' do
      User.create(first_name: 'Bob', surname: 'Smith', email: 'bob@mail.com')
      User.create(first_name: 'Bill', surname: 'Jones', email: 'bob@mail.com')
      expect(User.first(first_name: 'Bill')).to eq nil
    end
  end

  it 'saves a password recovery token when we generate a token' do
      expect{user.generate_token}.to change{user.password_token}
    end

    it "saves a password recovery token time when we generate a token using" do
      Timecop.freeze do
        user.generate_token
        expect(user.password_token_time).to eq Time.now
      end
    end

    it 'can find a user with a valid token' do
     user.generate_token
     expect(User.find_by_valid_token(user.password_token)).to eq user
    end

    it 'can\'t find a user with a token over 1 hour in the future' do
      user.generate_token
      Timecop.travel(60 * 60 + 1) do
        expect(User.find_by_valid_token(user.password_token)).to eq nil
      end
    end


end
