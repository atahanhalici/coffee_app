import 'package:coffee_app/models/user_model.dart';
import 'package:coffee_app/view_models/user_view_model.dart';
import 'package:coffee_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profil extends StatelessWidget {
  const Profil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel _user = Provider.of<UserViewModel>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 128, 20, 0),
          centerTitle: true,
          title: const Text("Profil"),
        ),
        bottomNavigationBar: const CoffeeBottomNavigationBar(
          sayi: 3,
        ),
        body: _user.state == ViewStates.geldi
            ? userGeldi(context, _user.asd)
            : _user.state == ViewStates.geliyor
                ? userGetiriliyor(_user)
                : const Text("Hata"));
  }

  userGeldi(BuildContext context, User user) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/coffeeapp_asset.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Bilgileriniz:",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
            height: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          row("Ad", user.ad),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
            height: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          row("Soyad", user.soyad),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
            height: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          row("E-Mail", user.email),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
            height: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          row("Toplam Puan", user.puan.toString()),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width - 60) / 2,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 128, 20, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: const Text("Bilgilerini Güncelle!"),
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width - 60) / 2,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 128, 20, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: const Text("Çıkış Yap"),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width - 48) / 3,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Hakkımızda",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width - 48) / 3,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sıkça Sorulan Sorular",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width - 48) / 3,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Gizlilik Sözleşmesi",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "© 2023 Coffee App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "Tüm Hakları Saklıdır",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Row row(String ozellik, String metin) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              ozellik + " :",
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              metin,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }

  userGetiriliyor(UserViewModel user) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
