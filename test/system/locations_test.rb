require "application_system_test_case"

class LocationsTest < ApplicationSystemTestCase
  setup do
    @location = locations(:one)
  end

  test "visiting the index" do
    visit locations_url
    assert_selector "h1", text: "Locations"
  end

  test "creating a Location" do
    visit locations_url
    click_on "New Location"

    fill_in "Comuna", with: @location.comuna
    fill_in "Lat", with: @location.lat
    fill_in "Long", with: @location.long
    fill_in "Medio generacion", with: @location.medio_generacion
    fill_in "Potencia neta mw", with: @location.potencia_neta_mw
    fill_in "Region", with: @location.region
    fill_in "Tipo energia", with: @location.tipo_energia
    click_on "Create Location"

    assert_text "Location was successfully created"
    click_on "Back"
  end

  test "updating a Location" do
    visit locations_url
    click_on "Edit", match: :first

    fill_in "Comuna", with: @location.comuna
    fill_in "Lat", with: @location.lat
    fill_in "Long", with: @location.long
    fill_in "Medio generacion", with: @location.medio_generacion
    fill_in "Potencia neta mw", with: @location.potencia_neta_mw
    fill_in "Region", with: @location.region
    fill_in "Tipo energia", with: @location.tipo_energia
    click_on "Update Location"

    assert_text "Location was successfully updated"
    click_on "Back"
  end

  test "destroying a Location" do
    visit locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location was successfully destroyed"
  end
end
