class MessagesController < ApplicationController
  # GET users/1/messages
  # GET users/1/messages.json
  def index 
    @user = User.find(params[:user_id])
    @messages = Message.last 20
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @messages }
    end
  end

 
  def edit
    @user = User.find(params[:user_id])
    @message = @user.messages.find(params[:id])
  end

  # POST users/1/messages
  # POST users/1/messages.json
  def create
    @user = User.find(params[:user_id])
    @message = @user.messages.build(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to([@message.user, @message], :notice => 'Message was successfully created.') }
        format.json { render :json => @message, :status => :created, :location => [@message.user, @message] }
        format.js
      else
        format.html { render :action => "new" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT users/1/messages/1
  # PUT users/1/messages/1.json
  def update
    @user = User.find(params[:user_id])
    @message = @user.messages.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to user_messages_path(current_user) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE users/1/messages/1
  # DELETE users/1/messages/1.json
  def destroy
    @user = User.find(params[:user_id])
    @message = @user.messages.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to user_messages_url(user) }
      format.json { head :ok }
    end
  end
end
