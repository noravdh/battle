feature 'Switch turns' do
  context 'seeing the current turn' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content "Pikachu's turn"
    end

    scenario 'after pplayer 1 attacks' do
      sign_in_and_play
      click_button 'ATTACK!'
      click_button 'OK'
      expect(page).not_to have_content "Pikachu's turn"
      expect(page).to have_content "Snorlax's turn"
      end
  end
end