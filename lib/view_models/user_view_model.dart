import 'package:coffee_app/locator.dart';
import 'package:coffee_app/models/user_model.dart';
import 'package:coffee_app/repository/kategori_repo.dart';
import 'package:flutter/material.dart';

enum ViewStates { geliyor, geldi, hata }

class UserViewModel with ChangeNotifier {
  final KategorilerRepo _kategorilerRepo = locator<KategorilerRepo>();
  ViewStates _state = ViewStates.geliyor;
  ViewStates get state => _state;
  User asd=User(ad: "", soyad: "", email: "",uid:"",puan:0);
  set state(ViewStates value) {
    _state = value;
    notifyListeners();
  }

  Future<User> userGetir(String uid) async {
    state = ViewStates.geliyor;
    try {
      asd = await _kategorilerRepo.getUser(uid);
      state = ViewStates.geldi;
      return asd;
    } catch (e) {
      state = ViewStates.hata;
      asd = User(ad: "", soyad: "", email: "",uid:"",puan: 0);

      return asd;
    }
  }
}
