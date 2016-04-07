require_relative "test_helper"

class OwnerTest < Minitest::Test
  def test_class_exists
    assert Owner
  end

  def test_class_is_ar_model
    assert_equal ActiveRecord::Base, Owner.superclass
  end

  def test_owner_can_be_created
    owner = Owner.new(name: "Bob", notes: "This is our best customer")
    assert owner.valid?, "is not valid"
    assert owner.save, "cannot be saved"
  end
end
