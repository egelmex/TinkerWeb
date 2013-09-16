module Jekyll
  class YoutubeTag < Liquid::Tag

    def initialize(tag_name, videoID, tokens)
      super
      @videoID = videoID
    end

    def render(context)
      <<-eos
<div class="videoWrapper">
<!-- Copy & Pasted from YouTube -->
<iframe width="560" height="349" src="http://www.youtube.com/embed/#{@videoID}" frameborder="0" allowfullscreen></iframe>
</div>
      eos
    end
  end
Liquid::Template.register_tag "youtube", self
end

Liquid::Template.register_tag('youtube', Jekyll::YoutubeTag)
