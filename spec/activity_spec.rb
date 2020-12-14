require 'spec_helper'
require 'activity'

describe Activity do

  let(:valid_params) { {activity: "", type: "", participants: 1, price: 1, link: nil, key: 1000000, accessibility: 0.0} }
  let(:invalid_params) { Hash.new }

  it 'initializes with valid parameters' do
    expect(Activity.new(valid_params)).to be_instance_of Activity
  end

  it 'participants count must be number' do
    expect(Activity.new(invalid_params)).to raise_error(TypeError)
  end


end