# Aslanoba Labs Websitesi

[Clean Blog][01] [Bootstrap][02] teması modifiye edilerek geliştirilen
[Jekyll][03] statik site uygulamasıdır.

## Kurulum

* Ruby 2.2.0 (rbenv/rvm)
* Bundler

```bash
git clone https://github.com/aslanobalabs/labs.aslanobagroup.com test_sitem
cd test_sitem/
bundle install --path=vendor/bundle
rake # ön izleme sunucusu
```

## Kullanım

`rake -T` ile ilgili seçenekleri listeleyebilirsiniz

Test sunucusunu `rake` yazarak çalıştırabilirsiniz. (*Varsayılan task*)

Yeni blog post’u oluşturmak için 3 farklı yönteminiz var:

```bash
rake post
# varolan başlıkla yeni yazı açar
# 2015-04-17-13-55-yeni-yazim.md

rake post["Başlık"]
# 2015-04-17-13-55-baslik.md

rake post["Başlık","2015-04-17 22:00"]
# 2015-04-17-22-00-baslik.md
```

## Ek Özellikler

* Rake yardımıyla kolay post oluşturma.
* i18n desteği, `{{ post.date | localize: "%d.%m.%Y" }}` ya da
`{{ post.date | localize: ":short" }}`
* Türçe sözlük `_data/messages.yml`
* Çevre değişkeni desteği `{{ site.env == "development" }}`

## Eksikler (To DO)

* stash ve draft özelliği gelecek
* i18n için açıklama
* Türkçe locale için örnek açıklama
* Disqus yorum eklentisi
* Deployment mekanızması
* Kategori ve Etiket eklentisi
* Paylaş eklentisi

## Kaynaklar

Sitede kullanılan fotoğraflar [wallpapervortex][04] sitesinden alınmıştır.

## Güncellemeler

2015-04-17

* İlk commit...
* Retina desteği eklendi

## Katkı Yapmak için

1. `fork` yapın ( https://github.com/aslanobalabs/labs.aslanobagroup.com/fork )
2. Kendi `branch`’inizi yapın (`git checkout -b benim-eklerim`)
3. Yaptıklarınızı `commit` edin (`git commit -am 'Yeni özellikler'`)
4. `branch`’i `push` edin (`git push origin benim-eklerim`)
5. Yeni bir **Pull Request** oluşturun!

[01]: http://startbootstrap.com/template-overviews/clean-blog/
[02]: http://getbootstrap.com/
[03]: http://jekyllrb.com/
[04]: http://www.wallpapervortex.com/
