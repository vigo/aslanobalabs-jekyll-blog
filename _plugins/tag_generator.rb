module Jekyll
  class TagIndex < Page    
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tags.html')
      self.data['tag'] = tag
      self.data['title'] = "&ldquo;" + tag + "&rdquo;"
      self.data['subtitle'] = site.data["messages"]["locales"][site.config["locale"]]["displaying_related_tags"]
    end
  end

  class TagGenerator < Generator
    safe true
    def generate(site)
      if site.layouts.key? 'tags'
        dir = site.config["tags_url"]
        site.tags.keys.each do |tag|
          write_tag_index(site, File.join(dir, tag), tag)
        end
      end
    end
  
    def write_tag_index(site, dir, tag)
      index = TagIndex.new(site, site.source, dir, tag)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end
end