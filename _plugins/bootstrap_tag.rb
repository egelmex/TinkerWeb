module Jekyll
  class SpanBlock < Liquid::Block

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end
    
    def render(context)
      @content = Liquid::Template.parse(super).render(context)
output = <<-eos
<div class=\"col-md-#{@text}\">
#{@content}
</div>
eos
output
    end
  end
end

module Jekyll
  class RowBlock < Liquid::Block

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      @content = super
<<-eos
<div class="row #{@text}">
#{@content}
</div>
eos
    end
  end
end

module Jekyll 
  class Jumbotron < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      @content = Liquid::Template.parse(super).render(context)
<<-eos
<div class="jumbotron #{@text}">
<div class="container">
#{@content}    
</div>
</div>
eos
    end
  end
end

module Jekyll
  class AlertBlock < Liquid::Block

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
	#Liquid::Template.parse(super).render(@content)
	@content = super 
<<-eos
<div class="alert alert-warning fade in"><button type="button" class="close" data-dismiss="alert">&times;</button> #{@content}</div>
eos
    end
  end
end


module Jekyll
  class WellBlock< Liquid::Block

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
	@content = super
<<-eos
<div class="well #{@text}">
#{@content}
</div>
eos

    end
  end
end


module Jekyll
  module DirFilter
    def dir(input)
	    d = File.dirname(input)
	    d
    end
  end
end

Liquid::Template.register_filter(Jekyll::DirFilter)

module Jekyll
  module BaseNameFilter
    def basename(input)
	    d = File.basename(input)
	    d
    end
  end
end

Liquid::Template.register_filter(Jekyll::BaseNameFilter)

Liquid::Template.register_tag('jumbotron', Jekyll::Jumbotron)
Liquid::Template.register_tag('span', Jekyll::SpanBlock)
Liquid::Template.register_tag('row', Jekyll::RowBlock)
Liquid::Template.register_tag('alert', Jekyll::AlertBlock)
Liquid::Template.register_tag('well', Jekyll::WellBlock)

module Jekyll
  class SortedForTag < Liquid::For
    def render(context)
      sorted_collection = context[@collection_name].dup
      sorted_collection.sort_by! { |i| i.to_liquid[@attributes['sort_by']] || 99999 }

      sorted_collection_name = "#{@collection_name}_sorted".sub('.', '_')
      context[sorted_collection_name] = sorted_collection
      @collection_name = sorted_collection_name

      super
    end

    def end_tag
      'endsorted_for'
    end
  end
end

Liquid::Template.register_tag('sorted_for', Jekyll::SortedForTag)
