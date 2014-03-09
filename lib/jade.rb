begin
  require 'jrjade'

  module Padrino
    module Jade
      ##
      # SafeBufferEnhancer is a Jade Enhancer that compiles templates that
      # are fit for using ActiveSupport::SafeBuffer as a Buffer.
      #
      # @api private
      # module SafeBufferEnhancer
      #   def add_expr_literal(src, code)
      #     src << " #{@bufvar}.concat((" << code << ').to_s);'
      #   end

      #   def add_stmt(src, code)
      #     code = code.sub('end', 'nil;end') if code =~ /\A\s*end\s*\Z/
      #     src << code
      #     src << ';' unless code[-1] == ?\n
      #   end

      #   def add_expr_escaped(src, code)
      #     src << " #{@bufvar}.safe_concat " << code << ';'
      #   end

      #   def add_text(src, text)
      #     src << " #{@bufvar}.safe_concat '" << escape_text(text) << "';" unless text.empty?
      #   end
      # end

      # ##
      # # SafeBufferTemplate is the classic Erubis template, augmented with
      # # SafeBufferEnhancer.
      # #
      # # @api private
      # class SafeBufferTemplate < ::Erubis::Eruby
      #   include SafeBufferEnhancer
      # end

      ##
      # Modded ErubisTemplate that doesn't insist in an String as output
      # buffer.
      #
      # @api private
      class Template < JrJade::JadeTemplate
        def render(*args)
          app       = args.first
          app_class = app.class
          @is_padrino_app = app.kind_of?(Padrino::Application) || 
            (app_class.respond_to?(:jade) && app_class.jade[:engine_class] == JrJade::JadeEngine)
          super
        end

        ##
        # In preamble we need a flag `__in_erb_template` and SafeBuffer for padrino apps.
        #
        # def precompiled_preamble(locals)
        #   original = super
        #   return original unless @is_padrino_app
        #   "__in_erb_template = true\n" << original.rpartition("\n").first << "#{@outvar} = _buf = ActiveSupport::SafeBuffer.new\n"
        # end
      end
    end
  end

  Tilt.prefer(Padrino::Jade::Template, :jade)

  if defined? Padrino::Rendering
    Padrino::Rendering.engine_configurations[:jade] = {
      :engine_class => JrJade::JadeEngine,
    }
  end
rescue LoadError
end
