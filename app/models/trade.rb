# == Schema Information
#
# Table name: trades
#
#  id          :integer          not null, primary key
#  trade_type  :integer
#  date        :datetime
#  price       :decimal(, )
#  cpf         :string
#  card_number :string
#  hour        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Trade < ApplicationRecord
  TRADE_TYPES = %w[nenhum debito juros financiamento credito emprestimo]

  enum trade_type: TRADE_TYPES

  validates :trade_type, :date, :price, :cpf, :card_number, :hour, presence: true
  validates :trade_type, inclusion: TRADE_TYPES
end
