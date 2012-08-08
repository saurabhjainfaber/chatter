# CURRENT FILE :: team_page.gemspec
require File.expand_path("../lib/chatter/version", __FILE__)

# Provide a simple gemspec so that you can easily use your
# Enginex project in your Rails apps through Git.
Gem::Specification.new do |s|
  s.name                      = "chatter"
  s.version                   = Chatter::VERSION
  s.platform                  = Gem::Platform::RUBY
  s.authors                   = [ "Saurabh Jain" ]
  s.email                     = [ "123saurabhjain@gmail.com" ]
  s.homepage                  = "https://github.com/saurabhjainfaber/chatter"
  s.description               = "Adds a chat functionality to any Rails 3 application. Send chat messages to online users within your application like any gmail/facebook chat. It assumes that you are using devise gem and user model as devise model for login."
  s.summary                   = "chatter-#{s.version}"

  s.rubyforge_project         = "chatter"
  s.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')

  s.add_dependency "activesupport" , ">= 3.0.7"
  s.add_dependency "rails"         , ">= 3.0.7"
  s.add_dependency "devise"        , '2.1'

  s.files = [
     ".gitignore",
     "Gemfile",
     "MIT-LICENSE",
     "README.rdoc",
     "Rakefile",
     "chatter.gemspec",
     "config/routes.rb",
     "lib/chatter.rb",
     "lib/chatter/engine.rb",
     "lib/chatter/version.rb",
     "lib/rails/generators/chatter/templates/chat.rb",
     "lib/rails/generators/chatter/templates/ol_chatter_image.png",
     "lib/rails/generators/chatter/templates/ol_chatter_status.png",
     "lib/rails/generators/chatter/templates/samplea.html.erb",
     "lib/rails/generators/chatter/templates/chats_controller.rb",
     "lib/rails/generators/chatter/templates/create_chats.rb",
      "lib/rails/generators/chatter/templates/add_status_to_users.rb",
       "lib/rails/generators/chatter/templates/add_username_to_users.rb",
         "lib/rails/generators/chatter/templates/add_name_to_users.rb",
     "lib/rails/generators/chatter/templates/chats.css.less",
     "lib/rails/generators/chatter/templates/screen.css.less",
     "lib/rails/generators/chatter/templates/jquery.js",
     "lib/rails/generators/chatter/templates/chats.js",
      "lib/rails/generators/chatter/templates/builder.js",
      "lib/rails/generators/chatter/templates/controls.js",
      "lib/rails/generators/chatter/templates/css_browser_selector.js",
      "lib/rails/generators/chatter/templates/dragdrop.js",
      "lib/rails/generators/chatter/templates/effects.js",
         
     "lib/rails/generators/chatter/install_generator.rb"
  ]
 
  s.require_path = 'lib'
  
  s.extra_rdoc_files = ["README.rdoc"]
  
  s.add_development_dependency 'yard'
end