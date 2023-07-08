class Kategori {
  String adi;
  String icon;

  Kategori({
    required this.adi,
    required this.icon,
  });
   Map<String, dynamic> toMap() {
    return {
      'adi': adi,
      'icon': icon,
    };
  }
   Kategori.fromMap(Map<String, dynamic> map)
      : adi = map["adi"],
        icon = map["icon"];
         @override
  String toString() {
    return "Mesaj {adi: $adi, icon: $icon}";
  }
}
