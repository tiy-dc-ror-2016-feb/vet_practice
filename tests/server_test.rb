require_relative "test_helper"

class ServerTest < Minitest::Test
  include Rack::Test::Methods

  def setup
  end

  def teardown
  end

  def app
    Server
  end

  def test_has_a_root_route
    response = get "/"
    assert response.ok?
  end

  def test_has_a_owners_route
    ::Owner.create!(name: "Bob")

    response = get "/owners"
    assert response.ok?, "route is not present"
    assert response.body.include?("Bob"), "bob is nowhere to be found"
  end

  def test_has_new_owner_route
    response = get "/owners/new"
    assert response.ok?, "status code not in 200 range"
  end

  def test_has_new_owner_displays_a_form
    response = get "/owners/new"
    assert response.body.include?("form"), "no forms found"
  end

  def test_owner_can_be_created_from_web
    response = post "/owners", {"owner" => {"name" => "Jill", "notes" => ""}}
    assert response.redirect?, "status code not in 200 range"
    assert ::Owner.where(name: "Jill").first
  end

  def test_owner_can_be_deleted
    prev_count = Owner.count
    owner = Owner.create(name: "Bob", notes: "This is our best customer")
    response = delete "/owners/#{owner.id}"

    assert response.redirect?, "status code not in 300 range"

    assert_equal prev_count, Owner.count
  end
end
