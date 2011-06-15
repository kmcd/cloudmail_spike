require 'mail'

class IncomingMailsController < ApplicationController    
  skip_before_filter :verify_authenticity_token

  def create
    message = Mail.new(params[:message])
    
    Email.create :message => message.body.decoded,
      :plain => message.body.decoded,
      :from => message.from.join(', '),
      :to => message.to.join(', '),
      :subject => message.subject

    render :text => 'success', :status => 200 # a status of 404 would reject the mail
  end
end
