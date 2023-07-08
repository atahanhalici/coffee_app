import 'package:coffee_app/models/kampanya_model.dart';
import 'package:coffee_app/models/kategori_model.dart';
import 'package:coffee_app/models/urun_model.dart';
import 'package:coffee_app/models/user_model.dart';

class KategoriService {
  List<Kategori> kategoriler = [];
  Future<List<Kategori>> kategoriGetir() async {
    if (kategoriler.isEmpty) {
      await Future.delayed(const Duration(seconds: 1));
      kategoriler.add(Kategori(
          adi: "Espressolu İçecekler - Latte",
          icon:
              "https://images.migrosone.com/sanalmarket/product/08059623/08059623-e20673-1650x1650.png"));
      kategoriler.add(Kategori(
          adi: "Espressolu İçecekler - Mocha",
          icon:
              "https://images.migrosone.com/sanalmarket/product/08059623/08059623-e20673-1650x1650.png"));
      kategoriler.add(Kategori(
          adi: "Espressolu İçecekler - Americano",
          icon:
              "https://images.migrosone.com/sanalmarket/product/08059623/08059623-e20673-1650x1650.png"));
      kategoriler.add(Kategori(
          adi: "Espressolu İçecekler - Macchiato",
          icon:
              "https://images.migrosone.com/sanalmarket/product/08059623/08059623-e20673-1650x1650.png"));
      kategoriler.add(Kategori(
          adi: "Espressolu İçecekler - Cappucino",
          icon:
              "https://images.migrosone.com/sanalmarket/product/08059623/08059623-e20673-1650x1650.png"));
      kategoriler.add(Kategori(
          adi: "Espressolu İçecekler - Doubleshot Espresso",
          icon:
              "https://images.migrosone.com/sanalmarket/product/08059623/08059623-e20673-1650x1650.png"));
      kategoriler.add(Kategori(
          adi: "Sıcak Çikolatalar",
          icon:
              "https://images.migrosone.com/sanalmarket/product/08059623/08059623-e20673-1650x1650.png"));
      kategoriler.add(Kategori(
          adi: "Filtre Kahveler",
          icon:
              "https://images.migrosone.com/sanalmarket/product/08059623/08059623-e20673-1650x1650.png"));
      kategoriler.add(Kategori(
          adi: "Muffin & Cookie",
          icon:
              "https://images.migrosone.com/sanalmarket/product/08059623/08059623-e20673-1650x1650.png"));
      kategoriler.add(Kategori(
          adi: "Pasta ve Kekler",
          icon:
              "https://images.migrosone.com/sanalmarket/product/08059623/08059623-e20673-1650x1650.png"));
      return kategoriler;
    } else {
      return kategoriler;
    }
  }

  Future<List<Urun>> urunGetir() async {
    List<Urun> urunler = [];
    if (urunler.isEmpty) {
      await Future.delayed(const Duration(seconds: 1));
      urunler.add(Urun(
          adi: 'Cafe Latte',
          resim:
              'https://globalassets.starbucks.com/assets/b635f407bbcd49e7b8dd9119ce33f76e.jpg?impolicy=1by1_wide_topcrop_630',
          besinDegeri: {
            "Enerji": '1280 kj / 306 kcal',
            "Yağ": "17,4 g",
            "Doymuş Yağ": "10 g",
            "Karbonhidrat": "31,1 g",
            "Şeker": "28,7 g",
            "Laktoz": "2,9 g",
            "Lif": "2.5 g",
            "Protein": "5,7 g",
            "Tuz": "0.5 g",
            "Süt Yağı": "6,4 g"
          },
          aciklama:
              'Zengin espresso, buharla ısıtılmış kadifemsi süt ve süt köpüğünün buluşması...',
          icindekiler:
              "İnek sütü, bitter çikolata (%30) [kakao kitlesi, şeker, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini)], süt kreması, şeker, yağsız süttozu, kırıntı bitter çikolata [(şeker, kakao kitlesi, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kırıntı sütlü çikolata [şeker, kakao yağı, tam yağlı süttozu, kakao kitlesi, yağsız süttozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kıvam verici (guar gam), salep.",
          alerjen:
              "Süt içerir. Eser miktarda fındık, antep fıstığı, ceviz, badem, yer fıstığı ,gluten, soya, balık, acı bakla, yumurta ve susam içerebilir.",
          fiyat: "47"));
      urunler.add(Urun(
          adi: 'Iced Cafe Latte',
          resim:
              'https://globalassets.starbucks.com/assets/b635f407bbcd49e7b8dd9119ce33f76e.jpg?impolicy=1by1_wide_topcrop_630',
          besinDegeri: {
            "Enerji": '1280 kj / 306 kcal',
            "Yağ": "17,4 g",
            "Doymuş Yağ": "10 g",
            "Karbonhidrat": "31,1 g",
            "Şeker": "28,7 g",
            "Laktoz": "2,9 g",
            "Lif": "2.5 g",
            "Protein": "5,7 g",
            "Tuz": "0.5 g",
            "Süt Yağı": "6,4 g"
          },
          aciklama:
              '(Buzlu Caffè Latte) Zengin espresso, soğuk süt ve buzun soğuk kahve severlerle ',
          icindekiler:
              "İnek sütü, bitter çikolata (%30) [kakao kitlesi, şeker, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini)], süt kreması, şeker, yağsız süttozu, kırıntı bitter çikolata [(şeker, kakao kitlesi, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kırıntı sütlü çikolata [şeker, kakao yağı, tam yağlı süttozu, kakao kitlesi, yağsız süttozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kıvam verici (guar gam), salep.",
          alerjen:
              "Süt içerir. Eser miktarda fındık, antep fıstığı, ceviz, badem, yer fıstığı ,gluten, soya, balık, acı bakla, yumurta ve susam içerebilir.",
          fiyat: "47"));
      urunler.add(Urun(
          adi: 'Vanilla Latte',
          resim:
              'https://globalassets.starbucks.com/assets/b635f407bbcd49e7b8dd9119ce33f76e.jpg?impolicy=1by1_wide_topcrop_630',
          besinDegeri: {
            "Enerji": '1280 kj / 306 kcal',
            "Yağ": "17,4 g",
            "Doymuş Yağ": "10 g",
            "Karbonhidrat": "31,1 g",
            "Şeker": "28,7 g",
            "Laktoz": "2,9 g",
            "Lif": "2.5 g",
            "Protein": "5,7 g",
            "Tuz": "0.5 g",
            "Süt Yağı": "6,4 g"
          },
          aciklama:
              'Zengin espresso, vanilya şurubu, buharla ısıtılmış kadifemsi süt ve süt köpüğünün buluşması',
          icindekiler:
              "İnek sütü, bitter çikolata (%30) [kakao kitlesi, şeker, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini)], süt kreması, şeker, yağsız süttozu, kırıntı bitter çikolata [(şeker, kakao kitlesi, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kırıntı sütlü çikolata [şeker, kakao yağı, tam yağlı süttozu, kakao kitlesi, yağsız süttozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kıvam verici (guar gam), salep.",
          alerjen:
              "Süt içerir. Eser miktarda fındık, antep fıstığı, ceviz, badem, yer fıstığı ,gluten, soya, balık, acı bakla, yumurta ve susam içerebilir.",
          fiyat: "57"));
      urunler.add(Urun(
          adi: 'Iced Vanilla Latte',
          resim:
              'https://globalassets.starbucks.com/assets/b635f407bbcd49e7b8dd9119ce33f76e.jpg?impolicy=1by1_wide_topcrop_630',
          besinDegeri: {
            "Enerji": '1280 kj / 306 kcal',
            "Yağ": "17,4 g",
            "Doymuş Yağ": "10 g",
            "Karbonhidrat": "31,1 g",
            "Şeker": "28,7 g",
            "Laktoz": "2,9 g",
            "Lif": "2.5 g",
            "Protein": "5,7 g",
            "Tuz": "0.5 g",
            "Süt Yağı": "6,4 g"
          },
          aciklama:
              '(Vanilya Aromalı Buzlu Latte) Zengin espresso, vanilya şurubu, soğuk süt ve buzun soğuk kahve severlerle buluşması',
          icindekiler:
              "İnek sütü, bitter çikolata (%30) [kakao kitlesi, şeker, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini)], süt kreması, şeker, yağsız süttozu, kırıntı bitter çikolata [(şeker, kakao kitlesi, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kırıntı sütlü çikolata [şeker, kakao yağı, tam yağlı süttozu, kakao kitlesi, yağsız süttozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kıvam verici (guar gam), salep.",
          alerjen:
              "Süt içerir. Eser miktarda fındık, antep fıstığı, ceviz, badem, yer fıstığı ,gluten, soya, balık, acı bakla, yumurta ve susam içerebilir.",
          fiyat: "57"));
      urunler.add(Urun(
          adi: 'Caramel Latte',
          resim:
              'https://globalassets.starbucks.com/assets/b635f407bbcd49e7b8dd9119ce33f76e.jpg?impolicy=1by1_wide_topcrop_630',
          besinDegeri: {
            "Enerji": '1280 kj / 306 kcal',
            "Yağ": "17,4 g",
            "Doymuş Yağ": "10 g",
            "Karbonhidrat": "31,1 g",
            "Şeker": "28,7 g",
            "Laktoz": "2,9 g",
            "Lif": "2.5 g",
            "Protein": "5,7 g",
            "Tuz": "0.5 g",
            "Süt Yağı": "6,4 g"
          },
          aciklama:
              'Zengin espresso, karamel şurubu, buharla ısıtılmış kadifemsi süt ve süt köpüğünün buluşması',
          icindekiler:
              "İnek sütü, bitter çikolata (%30) [kakao kitlesi, şeker, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini)], süt kreması, şeker, yağsız süttozu, kırıntı bitter çikolata [(şeker, kakao kitlesi, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kırıntı sütlü çikolata [şeker, kakao yağı, tam yağlı süttozu, kakao kitlesi, yağsız süttozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kıvam verici (guar gam), salep.",
          alerjen:
              "Süt içerir. Eser miktarda fındık, antep fıstığı, ceviz, badem, yer fıstığı ,gluten, soya, balık, acı bakla, yumurta ve susam içerebilir.",
          fiyat: "57"));
      urunler.add(Urun(
          adi: 'Iced Caramel Latte',
          resim:
              'https://globalassets.starbucks.com/assets/b635f407bbcd49e7b8dd9119ce33f76e.jpg?impolicy=1by1_wide_topcrop_630',
          besinDegeri: {
            "Enerji": '1280 kj / 306 kcal',
            "Yağ": "17,4 g",
            "Doymuş Yağ": "10 g",
            "Karbonhidrat": "31,1 g",
            "Şeker": "28,7 g",
            "Laktoz": "2,9 g",
            "Lif": "2.5 g",
            "Protein": "5,7 g",
            "Tuz": "0.5 g",
            "Süt Yağı": "6,4 g"
          },
          aciklama:
              '(Karamel Aromalı Buzlu Latte) Zengin espresso, karamel şurubu, soğuk süt ve buzun soğuk kahve severlerle buluşması',
          icindekiler:
              "İnek sütü, bitter çikolata (%30) [kakao kitlesi, şeker, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini)], süt kreması, şeker, yağsız süttozu, kırıntı bitter çikolata [(şeker, kakao kitlesi, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kırıntı sütlü çikolata [şeker, kakao yağı, tam yağlı süttozu, kakao kitlesi, yağsız süttozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kıvam verici (guar gam), salep.",
          alerjen:
              "Süt içerir. Eser miktarda fındık, antep fıstığı, ceviz, badem, yer fıstığı ,gluten, soya, balık, acı bakla, yumurta ve susam içerebilir.",
          fiyat: "57"));
      urunler.add(Urun(
          adi: 'Blonde Latte',
          resim:
              'https://globalassets.starbucks.com/assets/b635f407bbcd49e7b8dd9119ce33f76e.jpg?impolicy=1by1_wide_topcrop_630',
          besinDegeri: {
            "Enerji": '1280 kj / 306 kcal',
            "Yağ": "17,4 g",
            "Doymuş Yağ": "10 g",
            "Karbonhidrat": "31,1 g",
            "Şeker": "28,7 g",
            "Laktoz": "2,9 g",
            "Lif": "2.5 g",
            "Protein": "5,7 g",
            "Tuz": "0.5 g",
            "Süt Yağı": "6,4 g"
          },
          aciklama:
              'Hafif kavrulmuş (yumuşak içimli) Starbucks Blonde® espresso, buharla ısıtılmış kadifemsi süt ve süt köpüğünün dengeli buluşması',
          icindekiler:
              "İnek sütü, bitter çikolata (%30) [kakao kitlesi, şeker, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini)], süt kreması, şeker, yağsız süttozu, kırıntı bitter çikolata [(şeker, kakao kitlesi, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kırıntı sütlü çikolata [şeker, kakao yağı, tam yağlı süttozu, kakao kitlesi, yağsız süttozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kıvam verici (guar gam), salep.",
          alerjen:
              "Süt içerir. Eser miktarda fındık, antep fıstığı, ceviz, badem, yer fıstığı ,gluten, soya, balık, acı bakla, yumurta ve susam içerebilir.",
          fiyat: "54"));
      urunler.add(Urun(
          adi: 'Iced Blonde Latte',
          resim:
              'https://globalassets.starbucks.com/assets/b635f407bbcd49e7b8dd9119ce33f76e.jpg?impolicy=1by1_wide_topcrop_630',
          besinDegeri: {
            "Enerji": '1280 kj / 306 kcal',
            "Yağ": "17,4 g",
            "Doymuş Yağ": "10 g",
            "Karbonhidrat": "31,1 g",
            "Şeker": "28,7 g",
            "Laktoz": "2,9 g",
            "Lif": "2.5 g",
            "Protein": "5,7 g",
            "Tuz": "0.5 g",
            "Süt Yağı": "6,4 g"
          },
          aciklama:
              '(Buzlu Blonde Latte) Hafif kavrulmuş (yumuşak içimli) Starbucks Blonde® espresso, soğuk süt ve buzun soğuk kahve severlerle buluşması',
          icindekiler:
              "İnek sütü, bitter çikolata (%30) [kakao kitlesi, şeker, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini)], süt kreması, şeker, yağsız süttozu, kırıntı bitter çikolata [(şeker, kakao kitlesi, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kırıntı sütlü çikolata [şeker, kakao yağı, tam yağlı süttozu, kakao kitlesi, yağsız süttozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kıvam verici (guar gam), salep.",
          alerjen:
              "Süt içerir. Eser miktarda fındık, antep fıstığı, ceviz, badem, yer fıstığı ,gluten, soya, balık, acı bakla, yumurta ve susam içerebilir.",
          fiyat: "54"));
      urunler.add(Urun(
          adi: 'Caramel Waffle Latte',
          resim:
              'https://globalassets.starbucks.com/assets/b635f407bbcd49e7b8dd9119ce33f76e.jpg?impolicy=1by1_wide_topcrop_630',
          besinDegeri: {
            "Enerji": '1280 kj / 306 kcal',
            "Yağ": "17,4 g",
            "Doymuş Yağ": "10 g",
            "Karbonhidrat": "31,1 g",
            "Şeker": "28,7 g",
            "Laktoz": "2,9 g",
            "Lif": "2.5 g",
            "Protein": "5,7 g",
            "Tuz": "0.5 g",
            "Süt Yağı": "6,4 g"
          },
          aciklama:
              'Espresso, karamelli waffle şurubun buharda ısıtılmış kadifemsi süt ile buluştuğu ve karamel sos süslemesiyle sunulan yeni dönem lezzeti!',
          icindekiler:
              "İnek sütü, bitter çikolata (%30) [kakao kitlesi, şeker, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini)], süt kreması, şeker, yağsız süttozu, kırıntı bitter çikolata [(şeker, kakao kitlesi, kakao yağı, kakao tozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kırıntı sütlü çikolata [şeker, kakao yağı, tam yağlı süttozu, kakao kitlesi, yağsız süttozu, emülgatör (ayçiçek lesitini), parlatıcı (gam arabik)], kıvam verici (guar gam), salep.",
          alerjen:
              "Süt içerir. Eser miktarda fındık, antep fıstığı, ceviz, badem, yer fıstığı ,gluten, soya, balık, acı bakla, yumurta ve susam içerebilir.",
          fiyat: "65"));
      return urunler;
    } else {
      return urunler;
    }
  }

  // ignore: non_constant_identifier_names
  Future<String> QRTokenGetir(String urunID) async {
    await Future.delayed(const Duration(seconds: 1));
    return "T14982GJSDVMLS32904";
  }

  Stream<String> onayBekle() async* {
    print("çalıştım");
    String onayDurum = "Onaylanmadı";
    await Future.delayed(const Duration(seconds: 15));
    onayDurum = "Onaylandı";
    yield onayDurum;
  }

  Future<String> puanEkle() async {
    await Future.delayed(const Duration(seconds: 2));
    print("Veri tabanında bulunan üye puanına ürün puanı kadar ekleme yapıldı");
    return "basarili";
  }

  Future<List<Kampanya>> kampanyaGetir() async {
    List<Kampanya> kampanyalar = [];
    if (kampanyalar.isEmpty) {
      await Future.delayed(const Duration(seconds: 1));
      kampanyalar.add(Kampanya(
          adi: "Latte Çeşitleri 30 TL",
          aciklama:
              "Latte, Karamel, Toffee Not, Fındıklı ve Vanilyalı Latte Çeşitleri 30 TL!",
          resim:
              "https://i.lezzet.com.tr/images-xxlarge-secondary/latte-nedir-nasil-yapilir-63a67490-83ad-4a8c-a76a-dcb04e398985.jpg",
          sartlar: {
            "Giriş Yap/Üye Ol": "+",
            "Çok Kullanımlık Fırsat": "+",
            "Tüm Şubelerimizde Geçerli": "+"
          },
          puan: "30"));
      kampanyalar.add(Kampanya(
          adi: "Latte Çeşitleri 30 TL",
          aciklama:
              "Latte, Karamel, Toffee Not, Fındıklı ve Vanilyalı Latte Çeşitleri 30 TL!",
          resim:
              "https://i.lezzet.com.tr/images-xxlarge-secondary/latte-nedir-nasil-yapilir-63a67490-83ad-4a8c-a76a-dcb04e398985.jpg",
          sartlar: {
            "Giriş Yap/Üye Ol": "-",
            "Çok Kullanımlık Fırsat": "+",
            "Tüm Şubelerimizde Geçerli": "+"
          },
          puan: "30"));
      kampanyalar.add(Kampanya(
          adi: "Latte Çeşitleri 30 TL",
          aciklama:
              "Latte, Karamel, Toffee Not, Fındıklı ve Vanilyalı Latte Çeşitleri 30 TL!",
          resim:
              "https://i.lezzet.com.tr/images-xxlarge-secondary/latte-nedir-nasil-yapilir-63a67490-83ad-4a8c-a76a-dcb04e398985.jpg",
          sartlar: {
            "Giriş Yap/Üye Ol": "+",
            "Çok Kullanımlık Fırsat": "-",
            "Tüm Şubelerimizde Geçerli": "+"
          },
          puan: "30"));
      kampanyalar.add(Kampanya(
          adi: "Latte Çeşitleri 30 TL",
          aciklama:
              "Latte, Karamel, Toffee Not, Fındıklı ve Vanilyalı Latte Çeşitleri 30 TL!",
          resim:
              "https://i.lezzet.com.tr/images-xxlarge-secondary/latte-nedir-nasil-yapilir-63a67490-83ad-4a8c-a76a-dcb04e398985.jpg",
          sartlar: {
            "Giriş Yap/Üye Ol": "+",
            "Çok Kullanımlık Fırsat": "-",
            "Tüm Şubelerimizde Geçerli": "-"
          },
          puan: "30"));
      kampanyalar.add(Kampanya(
          adi: "Latte Çeşitleri 30 TL",
          aciklama:
              "Latte, Karamel, Toffee Not, Fındıklı ve Vanilyalı Latte Çeşitleri 30 TL!",
          resim:
              "https://i.lezzet.com.tr/images-xxlarge-secondary/latte-nedir-nasil-yapilir-63a67490-83ad-4a8c-a76a-dcb04e398985.jpg",
          sartlar: {
            "Giriş Yap/Üye Ol": "+",
            "Çok Kullanımlık Fırsat": "+",
            "Tüm Şubelerimizde Geçerli": "+"
          },
          puan: "30"));
      kampanyalar.add(Kampanya(
          adi: "Latte Çeşitleri 30 TL",
          aciklama:
              "Latte, Karamel, Toffee Not, Fındıklı ve Vanilyalı Latte Çeşitleri 30 TL!",
          resim:
              "https://i.lezzet.com.tr/images-xxlarge-secondary/latte-nedir-nasil-yapilir-63a67490-83ad-4a8c-a76a-dcb04e398985.jpg",
          sartlar: {
            "Giriş Yap/Üye Ol": "+",
            "Çok Kullanımlık Fırsat": "+",
            "Tüm Şubelerimizde Geçerli": "+"
          },
          puan: "30"));
      kampanyalar.add(Kampanya(
          adi: "Latte Çeşitleri 30 TL",
          aciklama:
              "Latte, Karamel, Toffee Not, Fındıklı ve Vanilyalı Latte Çeşitleri 30 TL!",
          resim:
              "https://i.lezzet.com.tr/images-xxlarge-secondary/latte-nedir-nasil-yapilir-63a67490-83ad-4a8c-a76a-dcb04e398985.jpg",
          sartlar: {
            "Giriş Yap/Üye Ol": "+",
            "Çok Kullanımlık Fırsat": "+",
            "Tüm Şubelerimizde Geçerli": "+"
          },
          puan: "30"));
      kampanyalar.add(Kampanya(
          adi: "Latte Çeşitleri 30 TL",
          aciklama:
              "Latte, Karamel, Toffee Not, Fındıklı ve Vanilyalı Latte Çeşitleri 30 TL!",
          resim:
              "https://i.lezzet.com.tr/images-xxlarge-secondary/latte-nedir-nasil-yapilir-63a67490-83ad-4a8c-a76a-dcb04e398985.jpg",
          sartlar: {
            "Giriş Yap/Üye Ol": "+",
            "Çok Kullanımlık Fırsat": "+",
            "Tüm Şubelerimizde Geçerli": "+"
          },
          puan: "30"));
      kampanyalar.add(Kampanya(
          adi: "Latte Çeşitleri 30 TL",
          aciklama:
              "Latte, Karamel, Toffee Not, Fındıklı ve Vanilyalı Latte Çeşitleri 30 TL!",
          resim:
              "https://i.lezzet.com.tr/images-xxlarge-secondary/latte-nedir-nasil-yapilir-63a67490-83ad-4a8c-a76a-dcb04e398985.jpg",
          sartlar: {
            "Giriş Yap/Üye Ol": "+",
            "Çok Kullanımlık Fırsat": "+",
            "Tüm Şubelerimizde Geçerli": "+"
          },
          puan: "30"));
      kampanyalar.add(Kampanya(
          adi: "Latte Çeşitleri 30 TL",
          aciklama:
              "Latte, Karamel, Toffee Not, Fındıklı ve Vanilyalı Latte Çeşitleri 30 TL!",
          resim:
              "https://i.lezzet.com.tr/images-xxlarge-secondary/latte-nedir-nasil-yapilir-63a67490-83ad-4a8c-a76a-dcb04e398985.jpg",
          sartlar: {
            "Giriş Yap/Üye Ol": "+",
            "Çok Kullanımlık Fırsat": "+",
            "Tüm Şubelerimizde Geçerli": "+"
          },
          puan: "30"));
      return kampanyalar;
    }
    return kampanyalar;
  }

  Future<User> userGetir(String uid) async {
    await Future.delayed(const Duration(seconds: 1));
    return User(
        ad: "Atahan",
        soyad: "Halıcı",
        email: "atahan@halici.com",
        uid: uid,
        puan: 100);
  }
}
