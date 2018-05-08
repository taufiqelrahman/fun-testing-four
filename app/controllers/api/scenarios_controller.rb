class Api::ScenariosController < ApiController
  # POST /scenarios params title, available_on, description, feature_id, steps[]
  def create
    scenario = Scenario.create!(scenario_params.merge(user_id: current_user.id))
    feature = Feature.find(params[:feature_id])
    scenario.features << feature
    json_response(step_builder(scenario), status: :created)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  # PUT /scenarios/:id params title, available_on, description, steps[]
  def update
    scenario = Scenario.find(params[:id])
    scenario.update(scenario_params)
    scenario.steps = []
    json_response(step_builder(scenario), status: :updated)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  # DELETE /scenarios:id
  def destroy
    scenario = Scenario.find(params[:id])
    scenario.delete
    head :no_content
  rescue => e
    render json: {error: e.message}, status: 422
  end

  private

  def scenario_params
    params.permit :title, :available_on, :description
  end

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