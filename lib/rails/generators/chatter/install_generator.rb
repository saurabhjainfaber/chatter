# CURRENT FILE :: lib/generators/team_page/team_page_generator.rb
# Requires


module Chatter
  module Generators
    class InstallGenerator < Rails::Generators::Base
     
  
      include Rails::Generators::Migration
      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates')
      end

      def self.next_migration_number(dirname)
        next_migration_number = current_migration_number(dirname) + 1
        
        if ActiveRecord::Base.timestamped_migrations
          [Time.now.utc.strftime("%Y%m%d%H%M%S"), "%.14d" % next_migration_number].max
        else
           "%.3d" % next_migration_number
           
         
        end
      end
      
      def generate_layout  
        
        copy_file "chat.rb", "app/models/chat.rb"
         
        copy_file "chats_controller.rb", "app/controllers/chats_controller.rb"  
         
        copy_file "chats.css.less", "app/assets/stylesheets/chats.css.less"  
        copy_file "screen.css.less", "app/assets/stylesheets/screen.css.less" 
         
        copy_file "samplea.html.erb", "app/views/chats/samplea.html.erb"  
          
        copy_file "jquery.js", "app/assets/javascripts/jquery.js"  
        copy_file "builder.js", "app/assets/javascripts/builder.js"  
        copy_file "chats.js", "app/assets/javascripts/chats.js"  
        copy_file "controls.js", "app/assets/javascripts/controls.js"  
        copy_file "css_browser_selector.js", "app/assets/javascripts/css_browser_selector.js"  
        copy_file "dragdrop.js", "app/assets/javascripts/dragdrop.js"  
        copy_file "effects.js", "app/assets/javascripts/effects.js"  
        
        copy_file "ol_chatter_image.png", "app/assets/images/ol_chatter_image.png"  
        copy_file "ol_chatter_status.png", "app/assets/images/ol_chatter_status.png" 
        
      
      end  
     
        

      def create_migration_file
        migration_template 'create_chats.rb', 'db/migrate/create_chats.rb'
        migration_template 'add_status_to_users.rb', 'db/migrate/add_status_to_users.rb'
        migration_template 'add_username_to_users.rb', 'db/migrate/add_username_to_users.rb'
        migration_template 'add_name_to_users.rb', 'db/migrate/add_name_to_users.rb'
      end
      
  
    end
  end
end
