feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_and_play
    click_button 'ATTACK!'
    expect(page).to have_content "Pikachu attacked Snorlax"
  end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_button 'ATTACK!'
    click_button 'OK'
    expect(page).not_to have_content 'Snorlax: 60HP'
    expect(page).not_to have_content 'Snorlax: 60HP'
  end
end