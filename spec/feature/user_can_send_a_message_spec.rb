
feature 'User can send a message' do
    context 'successfully' do
        before do
            visit root_path
            click_on "Inbox"
            click_on "Compose"
            click_on "user1"
            binding.pry
        end

        it '' do
            


        end
    end
end