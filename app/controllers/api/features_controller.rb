class Api::FeaturesController < ApiController
  def index
    limit = permit_params.fetch('limit', 30)
    offset = permit_params.fetch('offset', 0)
    page = (offset / limit) + 1
    keywords = permit_params[:keywords]
    query = Feature.all
    query = query.where('title LIKE ?', "#{keywords}%") unless keywords.blank?
    features = query.paginate(page: page, per_page: limit).to_a
    meta = {
      limit: limit,
      offset: offset
    }
    json_response(features, meta)
  end

  def show
    feature = Feature.find_by(id: permit_params[:id])
    json_response(feature)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  def update
    feature = Feature.find_by(id: permit_params[:id])
    feature = FeatureService.update(feature, permit_params[:title]) if feature
    json_response(feature)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  def destroy
    feature = Feature.find_by(id: permit_params[:id])
    feature.delete
    json_response(feature, status: 204)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  def scenarios
    feature = Feature.find_by(id: permit_params[:id])
    if feature
      limit = permit_params.fetch('limit', 30)
      offset = permit_params.fetch('offset', 0)
      page = (offset / limit) + 1
      query = feature.scenarios
      includes = permit_params[:includes].to_s.split(/[\,|\s]+/)
      query = query.includes(includes) if includes.present?
      scenarios = query.paginate(page: page, per_page: limit).to_a
      meta = {
        limit: limit,
        offset: offset
      }
      data = scenarios.map do |scenario|
        scenario.serializable_hash(include: includes)
      end
      json_response(data, meta)
    else
      json_response(nil)
    end
  end

  def create_report
    feature = Feature.find_by(id: permit_params[:id])
    if feature
      report = FeatureService.create_report(feature, current_user)
      json_response(report, status: 201)
    else
      json_response(nil)
    end
  end

  def permit_params
    params.permit(:id, :keywords, :limit, :offset, :title, :includes)
  end
end
