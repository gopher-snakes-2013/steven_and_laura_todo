require 'spec_helper'

describe 'user visits app', :js => true do

  it 'should show todo index as root' do
    visit('/')
    expect(page).to have_content('Welcome to our Todo App!')
  end
end

describe 'user creates todo', :js => true do
  it 'should allow user to create new todo' do
    visit('/')
    click_on('New Todo')
    fill_in('todo[content]', with: 'Walk Dog')
    click_button('Create Todo')
    expect(page).to have_content('Walk Dog')
  end
end

describe 'user edits todo', :js => true do
  before(:each) do
    visit('/')
    click_on('New Todo')
    fill_in('todo[content]', with: 'Walk Dog')
    click_button('Create Todo')
  end

  it 'should allow user to edit todo' do
    visit('/')
    click_on('Walk Dog')
    click_on('Edit')
    fill_in('todo[content]', with: 'Walk Cat')
    click_button('Done')
    expect(page).to have_content('Walk Cat')
  end
end

describe 'user can delete todo', :js => true do
  before(:each) do
    visit('/')
    click_on('New Todo')
    fill_in('todo[content]', with: 'Walk Dog')
    click_button('Create Todo')
  end

  it 'should allow user to delete todo' do
    visit('/')
    click_on('Walk Dog')
    click_on('Delete')
    expect(page).to have_no_content('Walk Dog')
  end
end
