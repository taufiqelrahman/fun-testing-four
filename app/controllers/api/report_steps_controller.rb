class Api::ReportStepsController < ApiController
  def index
    limit = permit_params.fetch('limit', 50)
    offset = permit_params.fetch('offset', 0)
    page = (offset / limit) + 1
    reports = Report::Step.paginate(page: page, per_page: limit).to_a
    meta = {
      limit: limit,
      offset: offset
    }
    json_response(reports, meta)
  end

  def show
    report = Report::Step.find_by(id: permit_params[:id])
    includes = permit_params[:includes].to_s.split(/[\,|\s]+/)
    if includes.present?
      data = report.serializable_hash(include: includes)
    else
      data = report
    end
    json_response(data)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  def update
    report = Report::Scenario.find_by(id: permit_params[:id])
    report = ReportService.update_report_step(report, {state: permit_params[:state], desciption: permit_params[:desciption]}) if report
    json_response(report)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  def permit_params
    params.permit(:id, :limit, :offset, :state, :includes, :desciption)
  end
end
