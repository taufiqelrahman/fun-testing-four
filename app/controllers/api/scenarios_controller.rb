class Api::ScenariosController < ApiController
  def create
    scenario = Scenario.create!(scenario_params.merge(user_id: current_user.id))
    json_response(step_builder(scenario), status: :created)
  end

  def update
    scenario = Scenario.find(params[:id])
    scenario.update(scenario_params)
    scenario.steps = []
    json_response(step_builder(scenario), status: :updated)
  end

  def destroy
    scenario = Scenario.find(params[:id])
    scenario.delete
    head :no_content
  end

  private

  def step_builder(scenario)
    if params['steps']
      steps = []
      params['steps'].each do |step|
        current_step = Step.where(["title = :t ", { t: step }])
        if current_step.empty?
          current_step = Step.new
          current_step.title = step
          current_step.available_on = scenario.available_on
          current_step.user_id = current_user.id
        end
        scenario.steps << current_step
      end
    end
    scenario
  end
  
end