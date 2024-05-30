namespace :dev do
  desc "Destroy and reset db"
  task reprime: ["db:drop", "db:create", "db:migrate", :prime]

  desc "Hydrate db with sample data"
  task prime: :environment do
    User.destroy_all
    Run.destroy_all

    5.times do
      run = Run.create(
        title: Faker::Educator.course_name,
        description: Faker::Lorem.paragraphs(number: 3).join("\n\n")
      )

      1.upto(100) do |i|
        run_unit = run.run_units.create(
          title: "#{i.ordinalize} unit",
          description: Faker::Lorem.paragraphs(number: 3).join("\n\n"),
          weight: [0, 5, 10, 15, 20, 25].sample,
          passing_progress: rand(0.5..1.0).round(1)
        )

        next if i == 1

        predecessor_il = run_unit.prior_position.indentation_level

        indentation_level = rand(0..(predecessor_il + 1))

        run_unit.update(indentation_level:)
      end
    end

    %w[alice bob carol dave eve].each do |username|
      User.create(
        email: "#{username}@example.com",
        password: "password"
      )
    end

    User.all.each do |user|
      Run.all.sample(3).each do |run|
        run_submission = RunSubmission.find_or_create_by(run:, user:)

        run.run_units.order(:position).each do |run_unit|
          run_unit_submission = run_unit.run_unit_submissions.create!(
            run:,
            user:,
            run_submission:,
            progress: rand(0.2..1.0).round(1)
          )

          unless run_unit_submission.passing?
            break
          end
        end
      end
    end
  end
end
