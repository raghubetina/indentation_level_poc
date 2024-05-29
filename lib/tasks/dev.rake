namespace :dev do
  desc "Hydrate db with sample data"
  task prime: :environment do
    Run.destroy_all

    5.times do
      run = Run.create(
        title: Faker::Educator.course_name,
        description: Faker::Lorem.paragraphs(number: 3).join("\n\n")
      )

      1.upto(100) do |i|
        run_unit = run.run_units.create(
          title: "#{i.ordinalize} unit",
          description: Faker::Lorem.paragraphs(number: 3).join("\n\n")
        )

        next if i == 1

        predecessor_il = run_unit.prior_position.indentation_level

        indentation_level = rand(0..(predecessor_il + 1))

        run_unit.update(indentation_level:)
      end
    end
  end
end
