# Don't forget to set the session[:username] after login

  class ChatsController < ::ApplicationController
    include ActionView::Helpers::SanitizeHelper
 
  before_filter :set_arrays
  
  def samplea
    
   if user_signed_in?
      Chat.update_status(current_user)
      session[:username] = current_user.username
    
    @onlineusers = User.find(:all, :conditions => ["status= 'online' and id != '#{current_user.id}'"])
    
    end
    
    
  end
  
  
  
  def chat_heartbeat    
   
  
    items = []
    Chat.find(:all, :conditions => {:to => session[:username], :recd => 0}, :order => 'id ASC').each do |chat|
      items = session[:chat_history][chat.from] if session[:open_chat_boxes][chat.from].nil? and session[:chat_history][chat.from]
      chat.message = sanitize(chat.message)
      
    
      
      items << {:s => 0, :f => chat.from, :m => chat.message}
      
      session[:chat_history][chat.from] = [] if session[:chat_history][chat.from].nil?
      
      session[:chat_history][chat.from] << {:s => 0, :f => chat.from, :m => chat.message}
      
      session[:ts_chat_boxes][chat.from] = nil
      
      session[:open_chat_boxes][chat.from] = chat.sent
      
    
      chat.recd = 1
      chat.save!
    end
    if !session[:open_chat_boxes].empty?
      session[:open_chat_boxes].each do |chatbox, value|
        if session[:ts_chat_boxes][chatbox].nil?
        
         
          time = DateTime.parse(value.to_s)
          now = (DateTime.now - time) * 86400
          stime = time.strftime("%I:%MAM %b #{time.day.ordinalize}")
          message = "Sent at #{stime}"
          if now > 120
            items << {:s => 2, :f => chatbox, :m => "{#{message}}"}
            session[:chat_history][chatbox] = [] if session[:chat_history][chatbox].nil?
            session[:chat_history][chatbox] << {:s => 2, :f => chatbox, :m => "{#{message}}"}
            session[:ts_chat_boxes][chatbox] = 1;
          end
        end
      end
    end
    render :json => {:items => items}.to_json
  end
  
  def start_chat_session
   
    items = []
    if !session[:open_chat_boxes].empty?
      session[:open_chat_boxes].each do |chatbox, item|
        items += chat_box_session(chatbox)
      end
    end
    render :json => {:username =>  current_user.try(:username).to_s, :items => items}.to_json
  end
  
  def send_chat
  
    from =   current_user.username
    
    to = params[:to]
    
    message = params[:message]
  
    session[:open_chat_boxes][to] = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
    messagesan = sanitize(message)
    session[:chat_history][to] = [] if session[:chat_history][to].nil?
    session[:chat_history][to] << {:s => 1, :f => "{#{to}}", :m => "#{messagesan}"}
    session[:ts_chat_boxes][to] = nil
    Chat.create(:from => from, :to => to, :message => messagesan, :sent => DateTime.now)
     
    render :text => 1
  end
  
  

  
  def close_chat
   
    #session[:open_chat_boxes][params[:chatbox]] = nil
    render :text => 1
  end
  
  
private
  def chat_box_session(chatbox)
    
    return session[:chat_history][chatbox] if session[:chat_history][chatbox]
    return []
  end
  
  def set_arrays
   
    session[:chat_history] = Hash.new if session[:chat_history].nil? 
    session[:open_chat_boxes] = Hash.new if session[:open_chat_boxes].nil?
    session[:ts_chat_boxes] = Hash.new if session[:ts_chat_boxes].nil?
  end
  
  
  end



