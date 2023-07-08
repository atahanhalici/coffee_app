import 'package:coffee_app/models/user_model.dart';
import 'package:coffee_app/view_models/user_view_model.dart';
import 'package:coffee_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel _user = Provider.of<UserViewModel>(context, listen: true);
    return Scaffold(
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
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 112, 66),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/logo.jpg",
                fit: BoxFit.cover,
              ),
            ),
            stretch: true,
            pinned: true,
            collapsedHeight: 50,
            expandedHeight: MediaQuery.of(context).size.width < 420 ? 300 : 180,
            backgroundColor: Colors.transparent,
            toolbarHeight: 50,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white, size: 25),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            /* Stack(
              children: [*/
            Container(
              //margin: EdgeInsets.only(top: 50),
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36))),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Profil",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    row("Ad", user.ad),
                    const SizedBox(
                      height: 10,
                    ),
                    row("Soyad", user.soyad),
                    const SizedBox(
                      height: 10,
                    ),
                    row("E-Mail", user.email),
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
                                primary: const Color.fromARGB(255, 30, 59, 49),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {},
                            child: const Text("Bilgilerini Güncelle"),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 30, 59, 49),
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
                          width: (MediaQuery.of(context).size.width - 50) / 3,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Hakkımızda",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 50) / 3,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Sıkça Sorulan Sorular",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 50) / 3,
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
                    const Center(
                      child: Text(
                        "© 2023 Coffee App",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Tüm Hakları Saklıdır",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
            /* ],
            ),*/
          ]))
        ]));
  }

  userGetiriliyor(UserViewModel user) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  row(String ozellik, String metin) {
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
                  fontSize: 15,
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
                fontSize: 15,
                color: Colors.black,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}
