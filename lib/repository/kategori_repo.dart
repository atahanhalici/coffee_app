import 'package:coffee_app/locator.dart';
import 'package:coffee_app/models/kampanya_model.dart';
import 'package:coffee_app/models/kategori_model.dart';
import 'package:coffee_app/models/urun_model.dart';
import 'package:coffee_app/models/user_model.dart';
import 'package:coffee_app/services/kategori_service.dart';

class KategorilerRepo {
  final KategoriService _kategoriService = locator<KategoriService>();
  Future<List<Kategori>> getKategori() async {
    return await _kategoriService.kategoriGetir();
  }

  Future<List<Urun>> getUrun() async {
    return await _kategoriService.urunGetir();
  }

  Future<String> getQR(String urunID) async {
    return await _kategoriService.QRTokenGetir(urunID);
  }

  Stream<String> onayBekle() async* {
    /*  String isim = "";

    _kategoriService.onayBekle().listen((event) {
      isim = event;
      if (isim == "Onaylandı") {}
    });*/
    yield* _kategoriService.onayBekle();
  }

  Future<String> puanEkle() async {
    return await _kategoriService.puanEkle();
  }

  Future<List<Kampanya>> getKampanya() async {
    return await _kategoriService.kampanyaGetir();
  }

  Future<User>getUser(String uid) async{
     return await _kategoriService.userGetir(uid);
  }


}
