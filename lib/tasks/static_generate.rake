namespace :static do
  desc 'Generate static version of the app'
  task generate: :environment do
    # Create static directory
    static_dir = Rails.root.join('public', 'static')
    FileUtils.mkdir_p(static_dir)

    # Generate static index.html
    content = ApplicationController.render(
      template: 'splash/index',
      layout: 'application'
    )

    # Write to file
    File.write(Rails.root.join(static_dir, 'index.html'), content)

    # Copy assets
    FileUtils.cp_r(Rails.root.join('public', 'assets'), static_dir)
  end
end
