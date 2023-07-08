class Urun {
  String adi;
  String resim;
  String aciklama;
  Map besinDegeri;
  String icindekiler;
  String alerjen;
  String fiyat;
  Urun(
      {required this.adi,
      required this.resim,
      required this.besinDegeri,
      required this.aciklama,
      required this.icindekiler,
      required this.alerjen,
      required this.fiyat});
  Map<String, dynamic> toMap() {
    return {
      'adi': adi,
      'resim': resim,
      'besinDegeri': besinDegeri,
      'aciklama': aciklama,
      'icindekiler': icindekiler,
      'alerjen': alerjen,
      'fiyat': fiyat
    };
  }

  Urun.fromMap(Map<String, dynamic> map)
      : adi = map["adi"],
        resim = map["resim"],
        besinDegeri = map["besinDegeri"],
        aciklama = map["aciklama"],
        icindekiler = map["icindekiler"],
        alerjen = map["alerjen"],
        fiyat = map["fiyat"];
  @override
  String toString() {
    return "Mesaj {adi: $adi, resim: $resim, besinDegeri: $besinDegeri, aciklama:$aciklama, icindekiler:$icindekiler,alerjen: $alerjen,fiyat: $fiyat}";
  }
}
