feature 'Enter names' do
  scenario 'submitting names' do
    visit('/')
    fill_in :player_1_name, with: 'Pikachu'
    fill_in :player_2_name, with: 'Snorlax'
    click_button 'Submit'
    expect(page).to have_content 'Pikachu vs. Snorlax'
  end
end