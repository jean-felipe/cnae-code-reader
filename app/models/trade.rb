# == Schema Information
#
# Table name: trades
#
#  id          :integer          not null, primary key
#  trande_type :integer
#  date        :datetime
#  price       :decimal(, )
#  cpf         :string
#  card_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Trade < ApplicationRecord
end
