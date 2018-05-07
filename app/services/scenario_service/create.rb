module ScenarioService
  class Create < Services::Base
    def initialize(user, title, available_on = 'desktop', description = '')
      @user = user
      @title = title
      @available_on = available_on
      @description = description
    end

    def perform
      scenario = Scenario.new
      ActiveRecord::Base.transaction do
        scenario.user = @user
        scenario.title = @title
        scenario.available_on = @available_on
        scenario.description = @description
        scenario.save!
      end
      scenario
    end
  end
end
