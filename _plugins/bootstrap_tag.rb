module Jekyll
  class SpanBlock < Liquid::Block

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end
    
    def render(context)
      @content = super
<<-eos
      <div class=\"span#{@text}\">
      #{@content}
      </div>
eos
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
<div class="row">
#{@content}
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
	Liquid::Template.parse(super).render(@content)
<<-eos
<div class="alert"><button type="button" class="close" data-dismiss="alert">&times;</button>
#{@content}
</div>
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
<div class="well">
#{@content}
</div>
eos

    end
  end
end


Liquid::Template.register_tag('span', Jekyll::SpanBlock)
Liquid::Template.register_tag('row', Jekyll::RowBlock)
Liquid::Template.register_tag('alert', Jekyll::AlertBlock)
Liquid::Template.register_tag('well', Jekyll::WellBlock)
