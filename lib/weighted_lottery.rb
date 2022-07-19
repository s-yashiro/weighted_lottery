require 'weighted_lottery/version'
require 'securerandom'

module WeightedLottery
  def pick items
    total = items.values.sum
    random = SecureRandom.random_number(total)
    chosen_type = nil
    items.each do |k, v|
      if random <= v
        chosen_type = k
        break
      end
      random -= v
    end
    chosen_type
  end

  module_function :pick
end
