import 'package:coffee_app/models/kampanya_model.dart';
import 'package:coffee_app/repository/kategori_repo.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';

enum ViewState { geliyor, geldi, hata }

class KampanyalarViewModel with ChangeNotifier {
  final KategorilerRepo _kategorilerRepo = locator<KategorilerRepo>();
  ViewState _state = ViewState.geliyor;
  ViewState get state => _state;
  late List<Kampanya> asd;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  Future<List<Kampanya>> kampanyalariGetir() async {
    state = ViewState.geliyor;
    try {
      asd = await _kategorilerRepo.getKampanya();
      state = ViewState.geldi;
      return asd;
    } catch (e) {
      state = ViewState.hata;
      List<Kampanya> asd = [
        Kampanya(adi: "", resim: "", aciklama: "", sartlar: {}, puan: "")
      ];
      return asd;
    }
  }

}
