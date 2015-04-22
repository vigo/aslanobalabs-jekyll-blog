require 'i18n'

I18n.enforce_available_locales = false
unless I18n::backend.instance_variable_get(:@translations)
  I18n.backend.load_translations Dir[File.join(File.dirname(__FILE__),'../_locales/*.yml')]
end
I18n.locale = Jekyll.configuration({})['locale'].to_sym || :tr

module Jekyll
   module I18nFilter
     # {{ post.date | localize: "%d.%m.%Y" }}
     # {{ post.date | localize: ":short" }}
     def localize(input, format=nil)
       I18n.locale = Jekyll.configuration({})['locale'].to_sym || :tr
       format = (format =~ /^:(\w+)/) ? $1.to_sym : format
       I18n.l input, :format => format
     end
     def translate(key)
       I18n.t key
     end
   end
end
Liquid::Template.register_filter(Jekyll::I18nFilter)
