module Response
  def json_response(object, meta = {status: :ok})
    data = nil
    if object.is_a?(ApplicationRecord)
      data = object.serializable_hash
    elsif object.is_a?(Array)
      data = object.map do |element|
        if element.is_a?(ApplicationRecord)
          element.serializable_hash
        else
          element
        end
      end
    elsif object.is_a?(Hash)
      data = object
    end
    meta = meta.with_indifferent_access
    meta.merge!(code: 200) unless meta[:status]
    if data.blank?
      meta.merge!(code: 404)
      meta[:status] = 'not found'
    end
    render json: { data: data, meta: meta }, status: meta[:code]
  end
end
