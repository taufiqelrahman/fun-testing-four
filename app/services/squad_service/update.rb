module SquadService
  class Update < Services::Base
    def initialize(squad, name, description = '')
      @squad = squad
      @name = name.presence || @squad.name
      @description = description.presence || @squad.description
    end

    def perform
      ActiveRecord::Base.transaction do
        @squad.name = @name
        @squad.description = @description
        @squad.save!
      end
      @squad
    end
  end
end
