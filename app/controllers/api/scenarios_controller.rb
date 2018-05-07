class Api::ScenariosController < ApiController
  def create
    scenario = Scenario.create!(scenario_params.merge(user_id: current_user.id))
    json_response(scenario, status: :created)
  end

  def update
    scenario = Scenario.find(params[:id])
    scenario.update(scenario_params)
    json_response(scenario, status: :no_content)
  end

  private

  def scenario_params
    params.permit :title, :available_on, :description
  end
  
end