require "stringex"

module Jekyll
  module AssetFilter
    def to_url(input)
      input.to_url
    end
  end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)