import 'package:coffee_app/models/kategori_model.dart';
import 'package:coffee_app/repository/kategori_repo.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';

enum ViewState { geliyor, geldi, hata }

class KategoriViewModel with ChangeNotifier {
  final KategorilerRepo _kategorilerRepo = locator<KategorilerRepo>();
  ViewState _state = ViewState.geliyor;
  ViewState get state => _state;
  late List<Kategori> asd;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  Future<List<Kategori>> kategorileriGetir() async {
    state = ViewState.geliyor;
    try {
      asd = await _kategorilerRepo.getKategori();
      state = ViewState.geldi;
      return asd;
    } catch (e) {
      state = ViewState.hata;
      List<Kategori> asd = [Kategori(adi: "asd", icon: "asd")];
      return asd;
    }
  }
}
