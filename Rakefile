# encoding: utf-8

require "bundler/setup"
require "stringex"

DATE_FORMAT = "%Y-%m-%d %H:%M"
NOW = Time.now.strftime(DATE_FORMAT)

task :default => [:serve]

task :serve do
  system "jekyll serve -w"
end

# rake post
# rake post["Başlık"]
# rake post["Başlık","2015-04-17 22:00"]
desc "Yeni blog post"
task :post, [:title, :post_date] do |t, args|
  title = args[:title] ? args[:title] : "Yeni Yazım"
  post_date = args[:post_date] ? DateTime.parse(args[:post_date]).strftime(DATE_FORMAT) : NOW
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
  output << "subtitle:      \"Alt Başlık\""
  output << "date:          #{post_date}"
  output << "# categories:    kategori kategori"
  output << "header-img:    \"images/post-bg.jpg\""
  output << "published: true"
  output << "---"
  return {
    filename: "#{post_date.gsub(/[ :]/, "-")}-#{title.to_url}.md",
    content: output.join("\n")
  }
end
