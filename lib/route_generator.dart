import 'package:coffee_app/pages/anasayfa.dart';
import 'package:coffee_app/pages/kampanyalar_page.dart';
import 'package:coffee_app/pages/kategoriler_page.dart';
import 'package:coffee_app/pages/profil_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? _gidilecekrota(Widget gidilecekWidget) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(builder: (context) => gidilecekWidget);
    } else {
      return MaterialPageRoute(builder: (context) => gidilecekWidget);
    }
  }

  static Route<dynamic>? rotaOlustur(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _gidilecekrota(const Anasayfa());
      case '/kategoriler':
        return _gidilecekrota( Kategoriler());
      case '/kampanyalar':
        return _gidilecekrota(const KampanyalarPage());
      case '/profil':
        return _gidilecekrota(const ProfilPage());
      default:
        return _gidilecekrota(const Anasayfa());
    }
  }
}
