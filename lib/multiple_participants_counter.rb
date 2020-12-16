class MultipleParticipantsCounter
  require 'object_from_api'
  require 'activity'

  attr_reader :count

  def initialize(times_to_call)
    @times_to_call = times_to_call
    @count = nil
  end

  def call
    count = 0
    @times_to_call.times do
      activity = ObjectFromApi.new(Activity, "https://www.boredapi.com/api/activity/").call
      count += 1 if activity&.multiple_participants?
    end
    @count = count
  end
end