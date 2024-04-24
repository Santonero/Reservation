require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  test "should not save a reservation without a ticket number" do
    reserv = Reservation.new(price: "20", email: "shade@shade.fr")
    assert_not reserv.save, "Saved the reservation without a ticket number"
  end

  test "should not allow duplicate ticket number" do
    reserv1 = Reservation.create(num_billet: "123456", price: "20", email: "shade@shade.fr")
    reserv2 = Reservation.new(num_billet: "123456", price: "20", email: "shade@shade.fr")
    assert_not reserv2.save, "Saved a duplicate ticket number"
  end

  test "price of a reservation should be a numeric value" do
    reserv = Reservation.new(num_billet: "123456", price: "a", email: "shade@shade.fr")
    assert_not reserv.save, "Saved a reservation with invalid price"
  end

  test "age of a reservation should be a numeric value" do
    reserv = Reservation.new(num_billet: "123456", price: "20", email: "shade@shade.fr", age: "a")
    assert_not reserv.save, "Saved a reservation with invalid age"
  end

  test "should save a reservation without age provided" do
    reserv = Reservation.new(num_billet: "123456", price: "20", email: "shade@shade.fr", age: nil)
    assert reserv.save, "Couldn't save a reservation without age"
  end

  test "should not save a reservation with an invalid email" do
    reserv = Reservation.new(num_billet: "123456", price: "20", email: "foobar.com")
    assert_not reserv.save, "Saved the reservation with an invalid email"
  end

  test "should downcase email adress" do
    reserv = Reservation.create(num_billet: "123456", price: "20", email: "FOO@baR.cOm")
    assert_no_match(/[[:upper:]]/, reserv.email)
  end

  test "should remove all spaces of email adress" do
    reserv = Reservation.create(num_billet: "123456", price: "20", email: " fo o@ ba r.co   m ")
    assert_no_match(/\s+/, reserv.email)
  end
end
