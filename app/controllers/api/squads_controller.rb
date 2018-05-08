class Api::SquadsController < ApiController
  def index
    limit = permit_params.fetch('limit', 30)
    offset = permit_params.fetch('offset', 0)
    page = (offset / limit) + 1
    keywords = permit_params[:keywords]
    query = Squad.all
    query = query.where('name LIKE ?', "#{keywords}%") unless keywords.blank?
    squads = query.paginate(page: page, per_page: limit).to_a
    meta = {
      limit: limit,
      offset: offset
    }
    json_response(squads, meta)
  end

  def show
    squad = Squad.find_by(id: permit_params[:id])
    json_response(squad)
  end

  def create
    squad = SquadService.create(permit_params[:name], permit_params[:description])
    json_response(squad, status: 201)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  def update
    squad = Squad.find_by(id: permit_params[:id])
    if squad
      squad = SquadService.update(squad, permit_params[:name], permit_params[:description])
    end
    json_response(squad)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  def features
    object = Squad.find_by(id: permit_params[:id])
    if object
      object = object.features.to_a.map do |feature|
        feature.serializable_hash(include: :last_report)
      end
    end
    json_response(object)
  end

  def create_feature
    object = Squad.find_by(id: permit_params[:id])
    object = FeatureService.create(object, feature_params[:title]) if object
    json_response(object)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  def summaries
    squad = Squad.find_by(id: permit_params[:id])
    data = {
      pending: 0,
      passed: 0,
      blocked: 0,
      failed: 0,
    }
    if squad
      squad.features.to_a.each do |feature|
        report = feature.last_report
        if report
          data[report.state.to_sym] += 1
        else
          data[:pending] += 1
        end
      end
      json_response(data)
    else
      json_response(squad)
    end
  end

  def permit_params
    params.permit(:id, :keywords, :limit, :offset, :name, :description)
  end

  def feature_params
    params.permit(:title)
  end
end
