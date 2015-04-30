class YouTube < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/
  def initialize(tagName, markup, tokens)
    super
    if markup =~ Syntax then
      @id = $1
    else
      raise "\"youtube\" tag için lütfen YouTube video ID'sini girin!"
    end
  end

  def render(context)
    "<div class=\"youtube-video\"><iframe src=\"http://www.youtube.com/embed/#{@id}\"></iframe></div>"
  end

  Liquid::Template.register_tag "youtube", self
end
