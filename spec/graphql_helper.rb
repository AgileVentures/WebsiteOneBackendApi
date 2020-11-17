RSpec::Matchers.define :json_contains do |expected, key|
    match do |actual|
      a = actual.collect {|x| x[key]}
      a.detect { |e| e == expected }
    end
end