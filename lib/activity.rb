class Activity
  def initialize(params)
    # valid params
    @participants = params[:participants]
  end

  def multiple_participants?
    @participants > 1
  end
  #
  # def valid(params)
  #   raise TypeError unless params[:participants].is_a? Integer
  # end
end