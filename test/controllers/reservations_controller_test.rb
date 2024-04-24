require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation_url
    assert_response :success
  end

  test "should redirect to new after attempting to create reservation without providing a file" do
    post reservations_url
    assert_redirected_to new_reservation_url
  end

  test "should redirect to new after attempting to create reservation with wrong file format" do
    post reservations_url, params: { file: file_fixture_upload("sample.xlsx", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") }
    assert_redirected_to new_reservation_url
  end

  test "should redirect to new after creating reservation" do
    post reservations_url, params: { file: file_fixture_upload("sample.csv", "text/csv") }
    assert_redirected_to new_reservation_url
  end

  test "should get new_search" do
    get new_search_url
    assert_response :success
  end

  test "should redirect to index after get search with blank query parameter" do
    get search_url(query: "", format: :turbo_stream)
    assert_redirected_to reservations_url
  end

  test "should redirect to index after get search if there is no search result" do
    get search_url(query: "bar", format: :turbo_stream)
    assert_redirected_to reservations_url
  end

  test "should get search if there is search result" do
    get search_url(query: "foo", format: :turbo_stream)
    assert_response :success
  end

  test "should get custom" do
    get custom_url(format: :turbo_stream)
    assert_response :success
  end
end
