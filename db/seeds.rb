# frozen_string_literal: true

klasses = [ Project, User, Event ]
old_counts = klasses.map(&:count)
should_prompt = old_counts.min > 0

puts 'Would you like to delete all the existing projects and documents from the database?' if should_prompt

if should_prompt
  print 'yes(y)/no(n): '
  response = STDIN.gets.downcase.chomp
else
  response = 'y'
end

if response == 'y' || response == 'yes'
  puts 'Clearing existing projects and documents'
  klasses.each(&:delete_all)

  pw = 'randomrandom'
  u = User.create(first_name: 'Random', last_name: 'Guy', email: 'random@random.com', password: pw)
  puts 'Added default user with email: ' + u.email + ' and password: ' + pw

  autograder = u.projects.create!(
    title: 'Autograder',
    description: 'Autograder for the EdX CS169.x SaaS course',
    status: 'Active',
    commit_count: 200,
    slug: 'autograder'
  )
  autograder.source_repositories.create!(url: 'https://github.com/saasbook/rag')

  websiteone = u.projects.create!(
    title: 'WebsiteOne',
    description: 'The AgileVentures site - a platform for online collaboration and crowdsourced project development.',
    status: 'Active',
    commit_count: 190,
    slug: 'websiteone'
  )
  websiteone.source_repositories.create!(url: 'https://github.com/AgileVentures/WebsiteOne')

  localsupport = u.projects.create!(
    title: 'LocalSupport',
    description: 'The open source project Local Support is a directory of local charity and non-profit organisations
       for a small geographical area.
Our customer is the non-profit organization Voluntary Action Harrow.
The mission is to support members of the public searching for support groups for things like helping care for an elderly
 or sick relative; and also to help charities and non-profits find each other and network.',
    status: 'Active',
    commit_count: 100,
    slug: 'localsupport'
  )
  localsupport.source_repositories.create!(url: 'https://github.com/AgileVentures/LocalSupport')

  educhat = u.projects.create!(
    title: 'EduChat',
    description: 'Supporting real time synchronous chat in online classes',
    status: 'Inactive',
    commit_count: 100,
    slug: 'educhat'
  )

  u.projects.create!(
    title: 'PP Scheduler',
    description: "Problem: Lots of people want to pair, but they don't know when each other are available
Solution: is something that requires absolutely minimal effort on their part to use in order to let them pair",
    status: 'Active',
    slug: 'pp-scheduler'
  )

  u.projects.create!(
    title: 'Funniest Computer Ever',
    description: "Can YOU write a program to make humans laugh? Get your editors fired up and your coding caps
      ready because you've arrived at the Funniest Computer Ever competition!",
    status: 'Active',
    slug: 'funniest-computer-ever'
  )

  u ||= User.last
  3.times do
    u.projects.create(
      title: Faker::Lorem.words(number: 3).join(' '),
      description: Faker::Lorem.paragraph,
      status: 'active',
      created_at: 1.month.ago,
      slug: Faker::Lorem.word
    )
  end

  Event.create!([
    {name: 'Atlantic Scrum', category: 'Scrum', description: '', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-05', time_zone: 'UTC', url: nil, slug: 'atlantic-scrum', start_datetime: '2018-08-05 14:19:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'WebsiteOne pair programming', category: 'PairProgramming', description: 'First steps for a new team member', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-07', time_zone: 'UTC', url: nil, slug: 'websiteone-pair-programming-1aed14cd-067e-470f-8315-0bce1f2c5a5e', start_datetime: '2018-08-07 08:43:00', duration: 60, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'OSRA - PP on Orphan model', category: 'PairProgramming', description: '', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-13', time_zone: 'UTC', url: nil, slug: 'osra-pp-on-orphan-model', start_datetime: '2018-08-13 19:01:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'pair programming: events including hookups, scrums, hangouts -- Yaro, Jon, and more?', category: 'PairProgramming', description: 'Possibly help Yaro with hangouts PR if theres anything left to do.\r\nPossibly work on a new feature to combine active, past and UPCOMING hangouts (both scrum & hookup).\r\nPossibly work on hookups table page to use Yaros new CSS/HTML table design\r\nPossibly work on existing Create Hookup PR  to use Yaros new CSS/HTML table design', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-14', time_zone: 'UTC', url: nil, slug: 'pair-programming-events-including-hookups-scrums-hangouts-yaro-jon-and-more', start_datetime: '2018-08-14 15:07:00', duration: 60, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'WebsiteOne: Authentications Controller Refactoring', category: 'PairProgramming', description: '', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-17', time_zone: 'UTC', url: nil, slug: 'websiteone-authentications-controller-refactoring', start_datetime: '2018-08-17 04:37:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'websiteone: event_occurrences bug fix / refactor', category: 'PairProgramming', description: "I've already submitted this as a PR, but it needs refactoring (which I already started on) and then new tests.", repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-18', time_zone: 'UTC', url: nil, slug: 'websiteone-event_occurrences-bug-fix-refactor', start_datetime: '2018-08-18 13:04:00', duration: 60, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'Pair Programming on OSRA', category: 'PairProgramming', description: "Pivotal Tracker story https://www.pivotaltracker.com/story/show/75757844: Introduce Factory Girl", repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-19', time_zone: 'UTC', url: nil, slug: 'pair-programming-on-osra', start_datetime: '2018-08-19 20:30:00', duration: 45, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'websiteone: event and hangout refactor: user stories', category: 'PairProgramming', description: 'please join us!', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-25', time_zone: 'UTC', url: nil, slug: 'websiteone-event-and-hangout-refactor-user-stories', start_datetime: '2018-08-25 16:04:00', duration: 90, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'events features (and more?)... Jon & Amal, others welcome.', category: 'PairProgramming', description: '', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-25', time_zone: 'UTC', url: nil, slug: 'events-features-and-more-jon-amal-others-welcome', start_datetime: '2018-08-25 21:11:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'websiteone: events & hangouts', category: 'PairProgramming', description: '', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-26', time_zone: 'UTC', url: nil, slug: 'websiteone-events-hangouts', start_datetime: '2018-08-26 13:26:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'Sagar', category: 'PairProgramming', description: '', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: true, repeat_ends_on: nil, time_zone: 'UTC', url: nil, slug: 'sagar', start_datetime: '2018-10-05 09:04:00', duration: 30, exclusions: nil, project_id: 64, creator_id: 9, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'TakeMeAway Client Meeting', category: 'Scrum', description: 'Client meeting', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: true, repeat_ends_on: nil, time_zone: 'UTC', url: nil, slug: 'takemeaway-client-meeting-ee031c7f-7cf6-49c2-8432-72e638d63870', start_datetime: '2018-09-01 18:00:00', duration: 45, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'Test for AV102', category: 'PairProgramming', description: '', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: true, repeat_ends_on: nil, time_zone: 'UTC', url: nil, slug: 'test-for-av102', start_datetime: '2018-09-22 19:01:00', duration: 2, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'First client meeting MetPlus', category: 'Scrum', description: "First client meeting of MetPlus with he agenda:\r\n1 - Introduction to MetPlus\r\n2 - Talk about PETS in a bit more details\r\n3 - Question about the product\r\n4 - Presentation of the technological solution\r\n5 - Questions about the technological solution", repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: true, repeat_ends_on: nil, time_zone: 'UTC', url: nil, slug: 'first-client-meeting-metplus', start_datetime: '2018-09-26 14:00:00', duration: 90, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'Event Scheduler', category: 'PairProgramming', description: 'Continue Iteration 1', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-28', time_zone: 'UTC', url: nil, slug: 'event-scheduler', start_datetime: '2018-08-28 15:31:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'OSRA Planning', category: 'Scrum', description: '28/08/2014 OSRA team planning meeting', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-28', time_zone: 'UTC', url: nil, slug: 'osra-planning', start_datetime: '2018-08-28 19:00:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'websiteone- event migration:: Jon, Amal, more?', category: 'PairProgramming', description: '', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-29', time_zone: 'UTC', url: nil, slug: 'websiteone-event-migration-jon-amal-more-8e67a0d9-7d78-4c32-9470-bb30e75f21ce', start_datetime: '2018-08-29 14:19:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'Codealia.org Reboot Meeting', category: 'Scrum', description: 'We hope to Reboot this project and put together a dev team and start talking about short and long-term strategy for Codealia.org.\r\nCodealia.org wants to get girls between 9 and 14 years old involved in coding. There are way too many guys hogging the coolest programming jobs. We believe the best way to change that is to start young women off with some basic coding skills that they can build on if they want to get a great job one day, or just be better at solving problems using computers in whatever field they go on to be awesome in :)', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-08-29', time_zone: 'UTC', url: nil, slug: 'codealia-org-reboot-meeting', start_datetime: '2018-08-31 17:00:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'env', category: 'PairProgramming', description: 'setting up an environment', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-09-01', time_zone: 'UTC', url: nil, slug: 'env', start_datetime: '2018-09-01 14:43:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'websiteone- event migration:: Jon, Christian,more?', category: 'PairProgramming', description: 'starting with fixing the bug in the events form... javascript andmore.', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 1, repeat_ends: false, repeat_ends_on: '2018-09-04', time_zone: 'UTC', url: nil, slug: 'websiteone-event-migration-jon-christian-more', start_datetime: '2018-09-04 12:19:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'one off meeting', category: 'Scrum', description: '', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-09-04', time_zone: 'UTC', url: nil, slug: 'one-off-meeting', start_datetime: '2018-09-04 17:03:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'Local Support Client Meeting', category: 'Scrum', description: 'Weekly client meeting local support', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-09-05', time_zone: 'UTC', url: nil, slug: 'local-support-client-meeting', start_datetime: '2018-09-05 15:30:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'Test Scrum', category: 'Scrum', description: '', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-09-02', time_zone: 'UTC', url: nil, slug: 'test-scrum', start_datetime: '2018-09-02 09:32:00', duration: 5, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'Test event', category: 'Scrum', description: 'Testing new stuff', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-09-02', time_zone: 'UTC', url: nil, slug: 'test-event-89fbd86b-fb96-440e-b717-e3da3bbf5aaf', start_datetime: '2018-09-02 09:32:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'OSRA Developer Meeting', category: 'PairProgramming', description: '', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-09-02', time_zone: 'UTC', url: nil, slug: 'osra-developer-meeting', start_datetime: '2018-09-02 17:00:00', duration: 60, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'one off meeting', category: 'PairProgramming', description: 'mock or double in rspec', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-09-08', time_zone: 'UTC', url: nil, slug: 'one-off-meeting-1da7a91c-a859-4947-b3b9-ecb61937be6d', start_datetime: '2018-09-08 14:35:00', duration: 30, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'Agile Ventures Retrospective', category: 'Scrum', description: "Let's review the last few weeks in Agile Ventures and work out what we could possibly be doing differently.\r\n\r\nHope to repeat this at least once a month", repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: true, repeat_ends_on: nil, time_zone: 'UTC', url: nil, slug: 'agile-ventures-retrospective', start_datetime: '2021-10-03 19:00:00', duration: 60, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true},
    {name: 'WSO event management', category: 'PairProgramming', description: 'event management implementation', repeats: 'never', repeats_every_n_weeks: 1, repeats_weekly_each_days_of_the_week_mask: 0, repeat_ends: false, repeat_ends_on: '2018-06-24', time_zone: 'UTC', url: nil, slug: 'wso-event-management-cbfc45cd-f214-42fd-b79b-15845e235fe4', start_datetime: '2021-06-24 14:30:00', duration: 90, exclusions: nil, project_id: nil, creator_id: nil, for: nil, modifier_id: nil, creator_attendance: true}
  ])

  Event.create!([
    {name: 'Morning event', category: 'Scrum', description: Faker::Lorem.paragraph, start_datetime: DateTime.now.change({ hour: 12, min: 15, sec: 0 }), duration: 800, repeats: 'weekly', repeats_every_n_weeks: '1', repeats_weekly_each_days_of_the_week_mask: '31', repeat_ends: 'never', repeat_ends_on:  Date.today + 1.year, time_zone: 'UTC'},
    {name: 'Evening event', category: 'Scrum', description: Faker::Lorem.paragraph, start_datetime: DateTime.now.change({ hour: 17, min: 45, sec: 0 }), duration: 160, repeats: 'weekly', repeats_every_n_weeks: '1', repeats_weekly_each_days_of_the_week_mask: '31', repeat_ends: 'never', repeat_ends_on:  Date.today + 1.year, time_zone: 'UTC'},
    {name: 'Premium event', for: 'Premium Mob Members', category: 'Scrum', description: Faker::Lorem.paragraph, start_datetime: DateTime.now.change({ hour: 11, min: 45, sec: 0 }), duration: 800, repeats: 'weekly', repeats_every_n_weeks: '1', repeats_weekly_each_days_of_the_week_mask: '31', repeat_ends: 'never', repeat_ends_on:  Date.today + 1.year, time_zone: 'UTC'}
  ])

  # Create ghost user
  # Rake::Task['user:create_anonymous'].invoke

end

klasses.each_with_index do |klass, i|
  puts "#{klass.name}.count " + old_counts[i].to_s + ' -> ' + klass.count.to_s
end
