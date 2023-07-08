import 'package:coffee_app/locator.dart';
import 'package:coffee_app/pages/puan_kazan_page.dart';
import 'package:coffee_app/repository/kategori_repo.dart';
import 'package:flutter/material.dart';

enum ViewState { gelmiyor, geliyor, geldi, hata }

class QRViewModel with ChangeNotifier {
  final KategorilerRepo _kategorilerRepo = locator<KategorilerRepo>();
  final PuanKazan _puanKazan = locator<PuanKazan>();
  ViewState _state = ViewState.gelmiyor;
  ViewState get state => _state;
  String id = "0";
  double width = 300;
  double height = 40;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  Future<String> QRGetir(String urunID) async {
    state = ViewState.geliyor;
    width = 0;
    height = 0;
    try {
      id = await _kategorilerRepo.getQR(urunID);
      state = ViewState.geldi;
      onayBekle();
      return id;
    } catch (e) {
      state = ViewState.hata;
      return id;
    }
  }

  Stream<String> onayBekle() async* {
    yield* _kategorilerRepo.onayBekle();
  }

  Future<String> puanEkle() async {
    var asd = await _kategorilerRepo.puanEkle();
    state = ViewState.gelmiyor;
    width = 300;
    height = 40;
    return asd;
  }
}
