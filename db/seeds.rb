20.times do 
  Event.create(
    name: Faker::Lorem.words(number: 3).join(' '),
    category: 'PairProgramming',
    time_zone: 'UTC',
    repeats: 'never',
    start_datetime: DateTime.now,
    duration: 60
  )
end
