require 'spec_helper'
require 'multiple_participants_counter'

describe MultipleParticipantsCounter do

  let(:activity_params) { {
      activity: "fake",
      type: "fake",
      participants: 1,
      price: 0.3,
      link: "",
      key: "1111111",
      accessibility: 0.1
  } }

  it 'have count getter' do
    expect(MultipleParticipantsCounter.new(0)).to respond_to(:count)
  end

  it 'counter uninitialized before call' do
    expect(MultipleParticipantsCounter.new(0).count).to be_nil
  end

  context 'call' do
    it 'have call method' do
      expect(MultipleParticipantsCounter.new(0)).to respond_to(:call)
    end

    it 'counter 0 when counting 0 records' do
      expect(MultipleParticipantsCounter.new(0).call).to match(0)
    end

    it 'result 0 if none activity have more than one participant' do
      stub_request(:get, "https://www.boredapi.com/api/activity/")
          .to_return(body: activity_params.to_json)
      expect(MultipleParticipantsCounter.new(1).call).to match(0)
    end

    it 'result 2 if 2 activities have more than one participant' do
      stub_request(:get, "https://www.boredapi.com/api/activity/")
          .to_return(body: activity_params.merge(participants: 2).to_json)
      expect(MultipleParticipantsCounter.new(2).call).to match(2)
    end
  end

end