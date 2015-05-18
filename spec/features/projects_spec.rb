feature 'Use creates a new project', %q{
  As a user of the site
  I want to be able to create a new project
  So I can organize my notes
} do

  before do
    @user = create(:user)
  end

  scenario 'User successfully creates new project' do
    signin(@user.email, @user.password)
    click_on 'Create new project'
    fill_in 'Title', with: 'My first project'
    click_on 'Create project'
    expect(@user.projects.count).to eql(1)
  end

end
