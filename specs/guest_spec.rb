require 'minitest/autorun'
require 'minitest/rg'
require_relative '../guest'

class GuestTest < MiniTest::Test

  def setup
    @test_guest = Guest.new({name: "Brian", money: 500, beds_wanted: 1})
  end

  def test_guest_has_a_name
    result = @test_guest.name
    assert_equal("Brian", result)
  end

  def test_guest_has_money
    result = @test_guest.money
    assert_equal(500, result)    
  end

  def test_guest_wants_a_number_of_beds
    result = @test_guest.beds_wanted
    assert_equal(1, result  )
  end


end