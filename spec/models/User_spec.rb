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




end
