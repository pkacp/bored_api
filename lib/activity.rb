class Activity
  def initialize(params)
    @participants = params[:participants] || params['participants']
  end

  def multiple_participants?
    @participants > 1
  end
end