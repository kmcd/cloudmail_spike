class Email < ActiveRecord::Base
  scope :threads, where("emails.to NOT LIKE '647b9c8e2c179d02a0db+%@cloudmailin.net'")
  
  def to_param
    [ id, subject ].join '-'
  end
  
  def to_text
    message_parts.first
  end
  
  def to_html
    message_parts.last
  end
  
  def message_parts()
    message.split(/\n/).reject {|line| line =~ /^(--|Content-Type|$)/ }
  end
  
  def reply_to
    "647b9c8e2c179d02a0db+#{to_param}@cloudmailin.net"
  end
  
  def replies
    Email.where :to => reply_to
  end
end
