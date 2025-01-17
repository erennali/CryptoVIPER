# CryptoVIPER

Bu proje, VIPER mimarisi kullanılarak geliştirilmiş bir iOS uygulamasıdır. Uygulama, bir API'den kripto para verilerini çeker ve liste halinde kullanıcıya sunar.

---

## 📌 Proje Özeti

CryptoVIPER, VIPER (View, Interactor, Presenter, Entity, Router) mimarisine uygun olarak yapılandırılmıştır. Proje, temiz bir yapı sunarken her modülün sorumluluğunu net bir şekilde ayrıştırır.  

---

## 🛠️ Kullanılan Teknolojiler

- **Swift**: iOS uygulaması geliştirme dili.
- **VIPER**: Uygulama mimarisi.
- **UIKit**: Kullanıcı arayüzü bileşenleri.
- **JSONDecoder**: JSON verilerini ayrıştırma.
- **API**: Kripto para verilerini sağlamak için kullanılan üçüncü taraf bir API.

---

## 📂 VIPER Mimarisi Nedir?

VIPER, iOS uygulama geliştirme için kullanılan, modüler bir mimaridir. VIPER'ın her modülü belirli bir sorumluluğa sahiptir:

- **View**: Kullanıcı arayüzü ve kullanıcıdan gelen etkileşimler.
- **Interactor**: İş mantığını içerir, veriyi işler ve Presenter'a iletir.
- **Presenter**: Görünüm ve iş mantığı arasında bir köprü görevi görür. View ile Interactor arasında iletişim sağlar.
- **Entity**: Veri modellerini tanımlar.
- **Router**: Ekranlar arasında gezinmeyi yönetir.

---

## 📸 Uygulama Özellikleri

- Kripto para listesini bir API'den çeker.
- Kullanıcı dostu bir arayüzde listeleme.
- VIPER mimarisi ile modüler yapı.

---

## 📋 Kurulum

1. Bu repoyu klonlayın:
   ```bash
   git clone https://github.com/erennali/CryptoVIPER.git
  
