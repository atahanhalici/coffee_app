import 'package:coffee_app/locator.dart';
import 'package:coffee_app/models/urun_model.dart';
import 'package:coffee_app/repository/kategori_repo.dart';
import 'package:flutter/material.dart';

enum ViewStates { geliyor, geldi, hata }

class UrunlerViewModel with ChangeNotifier {
  final KategorilerRepo _kategorilerRepo = locator<KategorilerRepo>();
  ViewStates _state = ViewStates.geliyor;
  ViewStates get state => _state;
  late List<Urun> asd;

  set state(ViewStates value) {
    _state = value;
    notifyListeners();
  }

  Future<List<Urun>> urunleriGetir() async {
    state = ViewStates.geliyor;
    try {
      asd = await _kategorilerRepo.getUrun();
      state = ViewStates.geldi;
      return asd;
    } catch (e) {
      state = ViewStates.hata;
      List<Urun> asd = [Urun(adi: "", resim: "", besinDegeri: {"":""},fiyat: "",aciklama: "",alerjen: "",icindekiler: "")];
      return asd;
    }
  }
}