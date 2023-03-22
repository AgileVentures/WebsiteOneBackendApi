# frozen_string_literal: true

class JwtBlacklist < ApplicationRecord
  self.table_name = 'jwt_blacklist'

#  include Devise::JWT::RevocationStrategies::Blacklist
end
