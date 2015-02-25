module Rack
  class Saml
    require 'rack/saml/misc/onelogin_setting'

    class OneloginRequest < AbstractRequest
      include OneloginSetting

      def initialize(request, config, metadata)
        super(request, config, metadata)
        @authrequest = OneLogin::RubySaml::Authrequest.new
      end

      def redirect_uri
        @authrequest.create(saml_settings(config))
      end
    end
  end
end
