require 'conduit/reactor/actions/base'

module Conduit::Driver::Reactor
  class Activate < Conduit::Driver::Reactor::Base
    url_route           '/lines'
    optional_attributes :line_id, :nid, :msid, :msl, :csa, :zip, :operator_name, :port_info, :callback_url
    http_method         :post

    def remote_url
      super + activate_url
    end

    def view_path
      File.join(File.dirname(action_path), 'views', 'activate')
    end

    def view
      tpl = self.class.name.demodulize
        .underscore.downcase
      
      if @options.key?(:line_id)
        tpl << '_existing_line'
      elsif @options.key?(:port_info)
        tpl << '_new_line_port'
      else
        tpl << '_new_line'
      end
     
      render(tpl, layout: false)
    end

    private

    def activate_url
      @options.key?(:line_id) ? "/#{@options[:line_id]}/activate" : '/activate'
    end
  end
end
