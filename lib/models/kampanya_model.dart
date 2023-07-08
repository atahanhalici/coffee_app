class Kampanya {
  String adi;
  String aciklama;
  String resim;
  Map sartlar;
  String puan;

  Kampanya(
      {required this.adi,
      required this.aciklama,
      required this.resim,
      required this.sartlar,
      required this.puan});
  Map<String, dynamic> toMap() {
    return {
      'adi': adi,
      'resim': resim,
      'aciklama': aciklama,
      'sartlar': sartlar,
      'puan': puan
    };
  }

  Kampanya.fromMap(Map<String, dynamic> map)
      : adi = map["adi"],
        resim = map["resim"],
        aciklama = map["aciklama"],
        sartlar = map["sartlar"],
        puan = map["puan"];

  @override
  String toString() {
    return "Mesaj {adi: $adi, resim: $resim,aciklama: $aciklama,sartlar: $sartlar,puan: $puan}";
  }
}
