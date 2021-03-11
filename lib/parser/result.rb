module Parser
  class Result
    attr_accessor :value, :reports

    def initialize(value = nil)
      @value = value
      @reports = []
    end
  end
end
