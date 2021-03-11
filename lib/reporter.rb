class Reporter
  def initialize
    @reports = []
  end

  # @param [Integer] row_number
  # @param [String] report
  #
  # @return [void]
  def add_for_column_number(row_number, column_name, report)
    @reports << "row[#{row_number}], column[#{column_name}]: #{report}"
  end

  # @yieldparam [String] report
  #
  # @return [void]
  def each(&block)
    @reports.each(&block)
  end

  private

  # @param [Array<string>] reports
  attr_reader :reports
end
