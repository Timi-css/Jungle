require 'rails_helper'

# RSpec.describe Widget, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe '#id' do
  it 'should not exist for new records' do
    @widget = Widget.new
    expect(@widget.id).to be_nil
  end

  it 'should be auto-assigned by AR for saved records' do
    @widget = Widget.new
    @widget.save!
    expect(@widget.id).to be_present
  end
end