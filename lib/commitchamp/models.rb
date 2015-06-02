module Commitchamp
  class User < ActiveRecord::Base
    has_many :contributions
    has_many :reposits, through: :contributions
  end

  class Reposit < ActiveRecord::Base
    has_many :contributions
    has_many :users, through: :contributions
  end

  class Contribution < ActiveRecord::Base
    belongs_to :users
    belongs_to :reposits
  end
end