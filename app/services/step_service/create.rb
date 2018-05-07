module StepService
  class Create < Services::Base
    def initialize(user, title, available_on = 'desktop')
      @user = user
      @title = title
      @available_on = available_on
    end

    def perform
      step = Step.new
      ActiveRecord::Base.transaction do
        step.user = @user
        step.title = @title
        step.available_on = @available_on
        step.save!
      end
      step
    end
  end
end
