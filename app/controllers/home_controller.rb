require 'mailgun'
class HomeController < ApplicationController
    def index
    end
    def write
        @almond=params[:title]
        @aufcl=params[:content]
        @banana=params[:qh]
        @apple=params[:qke]
        
        mg_client = Mailgun::Client.new("key-2d51d4e1d9eb48ff842ce570b070d8d3")

        message_params =  {
                   from: @banana,
                   to:   @apple,
                   subject: @almond,
                   text:    @aufcl
                  }

        result = mg_client.send_message('sandbox2cca51b50a8945bfb8f9eaab34db7c0f.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']
        
        new_post=Post.new
        new_post.title=params[:title]
        new_post.content=params[:content]
        new_post.sender=params[:qh]
        new_post.receiver=params[:qke]
        new_post.save
        
        redirect_to "/list"
        
        
        
    end
    def list
        @every_post = Post.all.order("id desc")
    end
end
