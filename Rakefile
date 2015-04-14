# encoding: utf-8

require "bundler/setup"
require "stringex"

DATE_FORMAT = "%Y-%m-%d %H:%M"
NOW = Time.now.strftime(DATE_FORMAT)

task :default => [:serve]

desc "Ön izleme..."
task :serve do
  system "jekyll serve"
end

# rake post["Title"]
# rake post["Title", "Date"]
desc "Yeni blog post"
task :post, :title, :post_date do |t, args|
  title = args[:title] ? args[:title] : "My Blog Post"
  post_date = args[:post_date] ? Date.parse(args[:post_date]).strftime(DATE_FORMAT) : NOW
  preps = prep_file(post_date, title)
  filename = preps[:filename]
  content = preps[:content]
  filename_path = "_posts/#{filename}"
  raise "Bu dosya: #{filename} zaten var..." if File.exists? filename_path
  File.write filename_path, content
  puts "Yeni blog dosyası oluşturuldu: #{filename}"
end


def prep_file(post_date, title)
  output = ["---"]
  output << "layout:        post"
  output << "title:         \"#{title}\""
  output << "subtitle:      \"#{title}\""
  output << "date:          #{post_date}"
  output << "categories:    category category"
  output << "header-img:    \"images/\""
  output << "published: true"
  output << "---"
  return {
    filename: "#{post_date.gsub(/[ :]/, "-")}-#{title.to_url}.md",
    content: output.join("\n")
  }
end
