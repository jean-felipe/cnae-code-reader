# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf

api_mime_types = %W(
  application/vnd.api+json
  text/x-json
  application/json
)

Mime::Type.unregister :json
Mime::Type.register 'application/json', :json, api_mime_types

# ActionDispatch::ParamsParser::DEFAULT_PARSERS[Mime::Type.lookup('application/vnd.api+json')]=lambda do |body|
#   JSON.parse(body)
# end

module JSONAPI
  module ActsAsResourceController
    def ensure_correct_media_type
      unless request.format.json?
        fail JSONAPI::Exceptions::UnsupportedMediaTypeError.new(request.content_type)
      end
    rescue => e
      handle_exceptions(e)
    end
  end
end