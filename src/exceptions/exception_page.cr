require "ecr"

module Lucky
  class ExceptionPage
    @params : Hash(String, String)
    @headers : Hash(String, Array(String))
    @session : Hash(String, HTTP::Cookie)
    @method : String
    @path : String
    @message : String
    @query : String
    @reload_code = ""
    @frames = [] of Frame

    def initialize(context : HTTP::Server::Context, @message : String)
      @params = context.request.query_params.to_h
      @headers = context.response.headers.to_h
      @method = context.request.method
      @path = context.request.path
      @url = "#{context.request.host_with_port}#{context.request.path}"
      @query = context.request.query_params.to_s
      @session = context.response.cookies.to_h
    end

    def generate_frames_from(message : String)
      FrameGenerator.generate_frames(message)
    end

    ECR.def_to_s "#{__DIR__}/exception_page.ecr"
  end

  class ExceptionPageClient < ExceptionPage
    def initialize(context : HTTP::Server::Context, @ex : Exception)
      super(context, @ex.message)
      @title = "Error #{context.response.status_code}"
      @frames = generate_frames_from(@ex.inspect_with_backtrace)
    end
  end

  class ExceptionPageServer < ExceptionPage
    def initialize(context : HTTP::Server::Context, message : String, @error_id : String)
      super(context, message)
      @title = "Build Error"
      @method = "Server"
      @path = Dir.current
      @frames = generate_frames_from(message)
    end
  end
end
