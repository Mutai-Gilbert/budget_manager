namespace :netlify do
  desc "Prepare assets for Netlify deployment"
  task prepare: :environment do
    # Ensure we're in production mode
    ENV['RAILS_ENV'] = 'production'
    
    # Create build directory
    sh 'rm -rf netlify_build'
    sh 'mkdir -p netlify_build'
    
    # Precompile assets
    Rake::Task["assets:precompile"].invoke
    
    # Copy necessary files to build directory
    sh 'cp -r public/* netlify_build/'
    sh 'cp -r public/assets netlify_build/'
    
    # Create a simple index.html for Netlify
    File.write('netlify_build/index.html', File.read('public/index.html')) if File.exist?('public/index.html')
    
    puts "Build completed! Assets are in netlify_build/"
  end
end 