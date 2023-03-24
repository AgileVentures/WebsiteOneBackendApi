RSpec::Matchers.define :json_contains do |expected, key|
  match do |actual|
    a = actual.pluck(key)
    a.detect { |e| e == expected }
  end
end