require 'rails_helper'

RSpec.describe Comment, type: :model do


  it 'is valid with valid attributes' do
    expect(Comment.new(body: "anything")).to be_valid
  end

  it 'is not valid without a body' do
    comment = Comment.new(body: nil)
    expect(comment).to_not be_valid
  end

  it 'is not valid with too short body' do
    comment = Comment.new(body: "asdf")
    expect(comment).to_not be_valid
  end

  it 'is not valid with too long body' do
    comment = Comment.new(body: "a" * 405)
    expect(comment).to_not be_valid
  end

end
