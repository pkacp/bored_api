require 'spec_helper'
require 'activity'

describe Activity do

  let(:valid_params) { {activity: "", type: "", participants: 1, price: 1, link: nil, key: 1000000, accessibility: 0.0} }
  let(:invalid_params) { Hash.new }

  it 'initializes with valid parameters' do
    expect(Activity.new(valid_params)).to be_instance_of Activity
  end

  it 'have multiple_participants? method' do
    expect(Activity.new(valid_params)).to respond_to(:multiple_participants?)
  end

  it '.multiple_participants? true when participants gt 1' do
    subject = Activity.new(valid_params.merge(participants: 2))
    expect(subject.multiple_participants?).to be_truthy
  end

  it '.multiple_participants? false when participants lt 2' do
    subject = Activity.new(valid_params)
    expect(subject.multiple_participants?).to be_falsey
  end


end