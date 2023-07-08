class User {
  String ad;
  String soyad;
  String email;
  String uid;
  int puan;

  User(
      {required this.ad,
      required this.soyad,
      required this.email,
      required this.uid,
      required this.puan});
  Map<String, dynamic> toMap() {
    return {'ad': ad, 'soyad': soyad, 'email': email, 'uid': uid, 'puan': puan};
  }

  User.fromMap(Map<String, dynamic> map)
      : ad = map["ad"],
        soyad = map["soyad"],
        email = map["email"],
        uid = map["uid"],
        puan = map["puan"];
  @override
  String toString() {
    return "Mesaj {ad: $ad, soyad: $soyad,email:$email, uid:$uid,puan:$puan}";
  }
}
