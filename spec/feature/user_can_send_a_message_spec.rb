feature 'User can send a message' do
  let(:user) {create(:user) }
    context 'successfully' do
        before do
            visit root_path
            click_on "Login"
            fill_in "Email", with: user.email
            fill_in "Password", with: user.password
            click_on "Log in"
            click_on "Inbox"
            click_on "Compose"
            click_on user.name
            fill_in "Subject", with: 'text'
            fill_in "conversation_body", with: 'hey'
            click_on "Send Message"
        end

        it 'succesfully went into inbox' do
        expect(page).to have_content 'Your message was successfully sent!'
        end
    end


    context 'unsuccessfully' do
        before do
            visit root_path
            click_on "Login"
            fill_in "Email", with: user.email
            fill_in "Password", with: user.password
            click_on "Log in"
            click_on "Inbox"
            click_on "Compose"
            click_on user.name
            fill_in "Subject", with: 'text'
            fill_in "conversation_body", with: ''
            click_on "Send Message"
        end

        it 'is expected to show error message' do
        expect(conversation.id).to be nil
        end
    end
end

