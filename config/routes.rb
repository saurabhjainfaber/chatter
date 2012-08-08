# CURRENT FILE :: config/routes.rb
Rails.application.routes.draw do
  
  # chat system
  resources :chats do
       collection do
         get :samplea
         get :start_chat_session
         post :send_chat
         get :chat_heartbeat
         post :close_chat
        end
        
       
    end
 
  
end
