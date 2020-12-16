require_relative 'lib/multiple_participants_counter'

counter = MultipleParticipantsCounter.new(5)
counter.call
puts counter.count