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

require 'rails_helper'

RSpec.describe Trade, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
