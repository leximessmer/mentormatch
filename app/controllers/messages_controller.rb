class MessagesController < ApplicationController
  before_action :current_user_must_be_message_sender, :only => [:edit, :update, :destroy]

  def current_user_must_be_message_sender
    message = Message.find(params[:id])

    unless current_user == message.sender
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @messages = Message.where(sender_id: current_user.id).or(Message.where(recipient_id: current_user.id)).page(params[:page]).per(10)
    
    render("messages/index.html.erb")
  end

  def show
    @message = Message.find(params[:id])

    render("messages/show.html.erb")
  end

  def new
    @message = Message.new

    render("messages/new.html.erb")
  end

  def create
    @message = Message.new

    @message.sender_id = params[:sender_id]
    @message.recipient_id = params[:recipient_id]
    @message.body = params[:body]

    save_status = @message.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/messages/new", "/create_message"
        redirect_to("/messages")
      else
        redirect_back(:fallback_location => "/", :notice => "Message created successfully.")
      end
    else
      render("messages/new.html.erb")
    end
  end

  def edit
    @message = Message.find(params[:id])

    render("messages/edit.html.erb")
  end

  def update
    @message = Message.find(params[:id])

    @message.recipient_id = params[:recipient_id]
    @message.body = params[:body]

    save_status = @message.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/messages/#{@message.id}/edit", "/update_message"
        redirect_to("/messages/#{@message.id}", :notice => "Message updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Message updated successfully.")
      end
    else
      render("messages/edit.html.erb")
    end
  end

  def destroy
    @message = Message.find(params[:id])

    @message.destroy

    if URI(request.referer).path == "/messages/#{@message.id}"
      redirect_to("/", :notice => "Message deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Message deleted.")
    end
  end
end
