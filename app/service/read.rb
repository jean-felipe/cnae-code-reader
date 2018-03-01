class Read
  attr_accessor :id
  attr_reader   :params, :result

  def initialize(id: nil, params: {})
    @id = id
    self.params = params
  end

  def params=(val)
    @params = HashWithIndifferentAccess.new(val)
  end

  def call
    @result = @id.nil? ? collection : collection.find(@id)
  end

  private

  def filters
    @filters ||= params[:filter] || params
  end
end