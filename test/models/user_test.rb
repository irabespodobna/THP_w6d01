require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: 'John', last_name: 'Kaka', email: 'john@example.com')
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without name' do
    @user.first_name = nil
    refute @user.valid?, 'saved user without a name'
    assert_not_nil @user.errors[:first_name], 'no validation error for name present'
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test 'invalid when name consists only from spaces' do
    refute @user.blank?, 'user is valid with a wrong name'
    assert_not_nil @user.errors[:first_name], 'no validation error for name present'
  end

    test 'invalid when email is not unique' do
      duplicate_email = @user.email.dup
      assert_not duplicate_email.valid?
    end

end