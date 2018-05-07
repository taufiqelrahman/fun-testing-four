class Api::FeaturesController < ApiController
  def index
    limit = permit_params.fetch('limit', 30)
    offset = permit_params.fetch('offset', 0)
    page = (offset / limit) + 1
    keywords = permit_params[:keywords]
    query = Feature.all
    query = query.where('title LIKE ?', "#{keywords}%") unless keywords.blank?
    squads = query.paginate(page: page, per_page: limit).to_a
    meta = {
      limit: limit,
      offset: offset
    }
    json_response(squads, meta)
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

  def permit_params
    params.permit(:id, :keywords, :limit, :offset, :title)
  end
end
