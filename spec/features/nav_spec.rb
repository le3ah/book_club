require 'rails_helper'

describe 'nav' do
  it 'should link to appropriate page' do

    visit root_path
    click_link "books"
    expect(current_path).to eq(books_path)
    click_link "home"
    expect(current_path).to eq(root_path)
  end
end
