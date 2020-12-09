feature "Testing the main page" do 
	scenario 'Main page runs and the content shows up' do
		visit "/"
		expect(page).to have_content "Wonna Snack?!"
	end 
	end