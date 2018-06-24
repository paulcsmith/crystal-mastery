require "ecr"

module Lucky::Exceptions
  class ExceptionPage
    class FrameGenerator
      def self.generate_frames(message)
        generated_frames = [] of Frame
        if raw_frames = message.scan(/\s([^\s\:]+):(\d+)([^\n]+)/)
          raw_frames.each_with_index do |frame, index|
            generated_frames << Frame.new(raw_frame: frame, index: index)
          end
        end
        if self.class.name == "ExceptionPageServer"
          generated_frames.reverse
        else
          generated_frames
        end
      end
    end

    struct Frame
      property index : Int32, raw_frame : Regex::MatchData

      def initialize(@raw_frame, @index)
      end

      def snippets : Array(Tuple(Int32, String, Bool))
        snippets = [] of Tuple(Int32, String, Bool)
        if File.exists?(file)
          lines = File.read_lines(file)
          lines.each_with_index do |code, codeindex|
            if (codeindex + 1) <= (line + 5) && (codeindex + 1) >= (line - 5)
              highlight = (codeindex + 1 == line) ? true : false
              snippets << {codeindex + 1, code, highlight}
            end
          end
        end
        snippets
      end

      def file : String
        raw_frame[1]
      end

      def info
        filename
      end

      private def filename : String
        file.split('/').last
      end

      def line : Int32
        raw_frame[2].to_i
      end

      def args
        "#{file}:#{line}#{raw_frame[3]}"
      end

      def app : String
        # TODO: Needs to check for crystal-lang too
        case file
        when .includes?("/crystal/")
          "crystal"
        when .includes?("/amber/")
          "amber"
        when .includes?("lib/")
          "shards"
        else
          context = "app"
          "app"
        end
      end

      def context
        if app == "app"
          "app"
        else
          "all"
        end
      end
    end

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
