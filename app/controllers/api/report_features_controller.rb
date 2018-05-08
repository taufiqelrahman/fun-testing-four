class Api::ReportFeaturesController < ApiController
  def index
    feature_id = params[:feature_id]
    reports = []
    if feature_id.present?
      reports << Report::Feature.find_by_feature_id(feature_id)
    else
      reports = Report::Feature.all
    end
    json_response(reports.to_a)
  end

end