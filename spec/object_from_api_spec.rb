require 'spec_helper'
require 'object_from_api'
# require 'activity'

describe ObjectFromApi do

  context 'call method' do

    let(:fake_endpoint) { "https://www.example.com/" }

    it 'have call method' do
      expect(ObjectFromApi.new(nil, nil)).to respond_to(:call)
    end

    it 'returns nil when nil parameters' do
      expect(ObjectFromApi.new(nil, nil).call).to be_nil
    end

    it 'builds object of class' do
      stub_request(:get, fake_endpoint).to_return(body: '[{"fake": "FAKE"}]')
      fake_class = double
      expect(fake_class).to receive(:new)
      ObjectFromApi.new(fake_class, fake_endpoint).call
    end

  end
end