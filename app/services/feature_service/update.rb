module FeatureService
  class Update < Services::Base
    def initialize(feature, title)
      @feature = feature
      @title = title
    end

    def perform
      ActiveRecord::Base.transaction do
        @feature.title = @title
        @feature.save!
      end
      @feature
    end
  end
end
