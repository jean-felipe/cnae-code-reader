class TradeResource < BaseResource
  attributes :trade_type, :date_of, :value, :cpf, :card_number, :date_hour, :file

  def file
    'txt - file'
  end

  def value
    return @model.price
  end

  def date_of
    @model.date.strftime("%d/%m/%Y")
  end

  def date_hour
    @model.hour.strftime("%H:%M:%S")
  end
end
