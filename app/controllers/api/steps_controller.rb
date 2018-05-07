class Api::StepsController < ApiController
  def create
    step = Step.new
    step.title = params[:title]
    step.available_on = params[:available_on]
    step.user_id = current_user.id
    step.scenarios << Scenario.find(params[:scenario_id])
    step.save!
    json_response(step, status: :created)
  end

end
