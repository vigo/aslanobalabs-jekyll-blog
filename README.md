# Aslanoba Labs Jekyll Blog

[Clean Blog][01] [Bootstrap][02] teması modifiye edilerek geliştirilen
[Jekyll][03] statik site uygulamasıdır.

## Yapılan Değişiklikler

* LESS yerine SASS entegre edildi. (CSS)
* Rake ile çeşitli otomasyon özellikleri geldi.
* Markdown Engine değiştirildi.

## Kurulum

* Ruby 2.2.0 (rbenv/rvm)
* Bundler

**Ruby** ve **Bundler** gem'inin kurulumunan sonra;

```bash
git clone https://github.com/aslanobalabs/aslanobalabs-jekyll-blog test_sitem
cd test_sitem/
bundle install --path=vendor/bundle
rake initialize  # ilk konfigürasyon dosyasının ayarlanması
```

Bu ilk kurulumdan sonra sadece `rake` yazarak ön izleme sunucusunu
çalıştırabilirsiniz.

## Kullanım

`rake -T` ile ilgili seçenekleri listeleyebilirsiniz:

```sh
rake initialize             # İlk kurulum (Lütfen önce bundle install yapın!)
rake post[title,post_date]  # Yeni blog post
```

Test sunucusunu `rake` yazarak çalıştırabilirsiniz. (*Varsayılan task*)

Yeni blog post’u oluşturmak için 3 farklı yönteminiz var:

```bash
rake post
# varolan (default) başlıkla yeni yazı açar
# 2015-04-17-13-55-yeni-yazim.md

rake post["Başlık"]
# otomatik olarak o anın tarihini kullanır
# 2015-04-17-13-55-baslik.md

rake post["Başlık","2015-04-17 22:00"]
# istediğiniz bir tarihe ait post oluşturmayı sağlar
# 2015-04-17-22-00-baslik.md
```

## Ek Özellikler

* i18n desteği, `{{ post.date | localize: "%d.%m.%Y" }}` ya da
`{{ post.date | localize: ":short" }}`
* Türçe sözlük `_data/messages.yml`
* Çevre değişkeni desteği `{{ site.env == "development" }}`

## Eksikler (To DO)

* **stash** ve **draft** özelliği gelecek
* Deployment mekanizması
* Kategori eklentisi
* Paylaş eklentisi

## Açıklamalar

### site.env

Özellikle disqus kullanımı esnasında, eğer geliştirme modundaysak boşu boşuna
disqus’ın kodunu siteye ekletmemek için yapılan kontrol. Aksi halde, disqus,
otomatik olarak `http://127.0.0.1:4000/` adresleriyle dolu sayfalar
oluşturmaktadır.

Yani siteyi test ederken, `disqus_shortname` girmenize rağmen ilgili eklentinin
çalışmadığını görünce panik olmayın :) Bu kısım siteyi üretirken çalışacak
ve canlıda (*production*) aktive olacaktır.

## Resim Ölçüleri ve Format

* Resimler `JPG` kullanılmıştır, isteğe göre başka bir format da
kullanabilirsiniz.
* Arkaplanlardaki resim ölçüsü  `1900 × 872 pixel` dir.
* Post içi fotoğraf ölçüsü `778 × 514 pixel` dir.

## Retina Desteği

Özellikle post içi resimlerde kullanmak için iki farklı ölüçüde dosya
oluşturmanız gerekir. Retina resimler `@2x` ile bitmeli. Örneğin post
içi resimlerde retina için:

* Normal resim : `778 × 514` ve `ornek-resim.jpg`
* Retina resim : `1556 × 1028` ve `ornek-resim@2x.jpg`

şeklinde olmalıdır. Kabaca retina için orijinal resmin tam 2 katı ölüçdeki
hali gerekmektedir.

## i18n ve Türkçe Desteği

Ruby on Rails'in locale dosyasından `_locales/tr.yml` sayesinde tarih işlemleri
ve çıktısında Türkçe kullanılabiliyor. Buna ek olarak `_data/messages.yml`
dosyasında da Türkçe sözlük bulunuyor.

    previous_posts: "ESKİLER"
    next_posts: "YENİLER"

gibi otomatik gelen mesajlar artık Türkçe. Kendiniz de ek yapar başka
şekillerde kullanmak isterseniz:

    # site.locale = tr (_config.yml)
    # site.data.messages.locales[site.locale]
    {{ site.data.messages.locales[site.locale].next_posts }} # ESKİLER

gibi kullanılabilir.


## Kaynaklar

Sitede kullanılan fotoğraflar [wallpapervortex][04] sitesinden alınmıştır.

## Güncellemeler

**2015-04-21**

* `I18n` ile ilgili bazı hatalar düzeltildi.
* `tags: [etiket1,etiket2]` gibi etiketleme desteği geldi.
* Etiketleri üreten sayfa jeneratörü eklendi.
* `{{ "Text" | to_url }}` Liquid filtresi eklendi.
* `_layouts/tags.html` Etiketler için eklendi
* `_includes/nav.html` etiket sayfaları ile ilgili düzenlendi.
* `.tags` adında `_sass/_custom-styles.css` direktif eklendi.
* `_locales/` de `en.yml` ve `tr.yml` düzenlendi.

**2015-04-20**

* `_config.yml` revizyon kontrol dışına alındı.
* `rake initialize` özelliği ile ilk kurulum için otomatik konfigürasyon geldi.
* Örnek site ve post için ayarlama yapıldı, `images/example/` dizinine gönderildi
örnek resimler.
* i18n ve locale açıklamaları eklendi.
* Mobil cihazlar için touch ikonları eklendi.
* Eksik JavaScript efekt eklemesi (menü)

**2015-04-17**

* İlk commit...
* Retina desteği eklendi
* Disqus yorum eklentisi

## Katkı Yapmak için

1. `fork` yapın ( https://github.com/aslanobalabs/aslanobalabs-jekyll-blog/fork )
2. Kendi `branch`’inizi yapın (`git checkout -b benim-eklerim`)
3. Yaptıklarınızı `commit` edin (`git commit -am 'Yeni özellikler'`)
4. `branch`’i `push` edin (`git push origin benim-eklerim`)
5. Yeni bir **Pull Request** oluşturun!

[01]: http://startbootstrap.com/template-overviews/clean-blog/
[02]: http://getbootstrap.com/
[03]: http://jekyllrb.com/
[04]: http://www.wallpapervortex.com/
