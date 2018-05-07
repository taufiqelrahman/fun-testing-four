module SquadService
  class Create < Services::Base
    def initialize(name, description = '')
      @name = name
      @description = description
    end

    def perform
      squad = Squad.new
      ActiveRecord::Base.transaction do
        squad.name = @name
        squad.description = @description
        squad.save!
      end
      squad
    end
  end
end
