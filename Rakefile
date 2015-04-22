# encoding: utf-8

require "bundler/setup"
require "stringex"
require "yaml"

DATE_FORMAT = "%Y-%m-%d %H:%M"
NOW = Time.now.strftime(DATE_FORMAT)

task :default => [:serve]

desc "İlk kurulum (Lütfen önce bundle install yapın!)"
task :initialize do
  unless File.exists?('./_config.yml')
    system "cp ./_config.example.yml ./_config.yml"
    puts "Konfigürasyon dosyası kopyalandı!"
  end
  Rake::Task["serve"].invoke
end

task :serve do
  system "jekyll serve -w --host 0.0.0.0"
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


namespace :deploy do
  desc "Deploy (Rsync)"
  task :rsync do
    raise "_credentials.yml dosyası bulunamadı!" unless File.exists?('./_credentials.yml')
    secrets = YAML.load_file('./_credentials.yml')
    deploy_to="#{secrets['user']}@#{secrets['server']}:#{secrets['path']}"
    ENV["JEKYLL_ENV"] = "production"
    system "jekyll build"
    system "rsync -av _site/ #{deploy_to}"
    puts "Rsync ile deploy işlemei tamamlandı!"
  end
end


def prep_file(post_date, title)
  output = ["---"]
  output << "layout:        post"
  output << "title:         \"#{title}\""
  output << "subtitle:      \"Alt Başlık\""
  output << "date:          #{post_date}"
  output << "# tags:          [etiket1,etiket2]"
  output << "header-img:    \"images/example/post-bg.jpg\""
  output << "published:     true"
  output << "# posted_by:     Ad Soyad"
  output << "---"
  return {
    filename: "#{post_date.gsub(/[ :]/, "-")}-#{title.to_url}.md",
    content: output.join("\n")
  }
end
