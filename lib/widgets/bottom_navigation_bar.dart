
import 'package:coffee_app/view_models/kampanyalar_view_model.dart';
import 'package:coffee_app/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/kategori_view_model.dart';

class CoffeeBottomNavigationBar extends StatelessWidget {
  final int sayi;
  const CoffeeBottomNavigationBar({Key? key, required this.sayi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Anasayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: "Ürünler",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_2),
            label: "Puan Kazan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        fixedColor: Color.fromARGB(255, 77, 177, 142),
        currentIndex: sayi,
        onTap: (index) {
          if (sayi != 1 && index == 1) {
            KategoriViewModel _kategoriler =
                Provider.of<KategoriViewModel>(context, listen: false);
            _kategoriler.kategorileriGetir();
            if (sayi != 0) {
              Navigator.pushReplacementNamed(context, '/kategoriler',
                  arguments: {});
            } else {
              Navigator.pushNamed(context, "/kategoriler");
            }
          } else if (sayi != 0 && index == 0) {
            Navigator.popUntil(context, (route) => route.settings.name == "/");
          } else if (sayi != 2 && index == 2) {
            KampanyalarViewModel _kampanyalar =
                Provider.of<KampanyalarViewModel>(context, listen: false);
            _kampanyalar.kampanyalariGetir();
            if (sayi != 0) {
              Navigator.pushReplacementNamed(context, '/kampanyalar',
                  arguments: {});
            } else {
              Navigator.pushNamed(context, "/kampanyalar");
            }
          } else if (sayi != 3 && index == 3) {
            UserViewModel _user =
                Provider.of<UserViewModel>(context, listen: false);
            _user.userGetir("asdasda");
            if (sayi != 0) {
              Navigator.pushReplacementNamed(context, '/profil', arguments: {});
            } else {
              Navigator.pushNamed(context, "/profil");
            }
          }
        });
  }
}
