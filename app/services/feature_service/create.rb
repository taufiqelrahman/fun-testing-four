module FeatureService
  class Create < Services::Base
    def initialize(squad, title)
      @squad = squad
      @title = title
    end

    def perform
      feature = Feature.new
      ActiveRecord::Base.transaction do
        feature.squad = @squad
        feature.title = @title
        feature.save!
      end
      feature
    end
  end
end
