import 'package:coffee_app/models/kampanya_model.dart';
import 'package:coffee_app/view_models/qr_model.dart';
import 'package:coffee_app/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PuanKazan extends StatelessWidget {
  final Kampanya kampanya;
  const PuanKazan({Key? key, required this.kampanya}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List keys = [];
    List values = [];
    keys.addAll(kampanya.sartlar.keys);
    values.addAll(kampanya.sartlar.values);
    bool buton = true;
    for (var item in values) {
      if (item == "-") {
        buton = false;
        break;
      }
    }
    QRViewModel _qrmodel = Provider.of<QRViewModel>(context, listen: true);

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 43, 30, 26),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: MediaQuery.of(context).size.width < 420
                  ? const Text("")
                  : const Icon(
                      Icons.keyboard_double_arrow_up,
                      color: Colors.white,
                    ),
              centerTitle: true,
              background: Image.network(
                kampanya.resim,
                fit: BoxFit.cover,
              ),
            ),
            stretch: true,
            pinned: true,
            collapsedHeight: 50,
            expandedHeight: MediaQuery.of(context).size.width < 420 ? 340 : 200,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          kampanya.adi,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Text(
                          kampanya.puan + " Puan",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(kampanya.aciklama),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Kampanya Şartları",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    /*const SizedBox(
                      height: 5,
                    ),*/
                    /*const SizedBox(
                          height: 5,
                        ),*/
                    kampanyaSartlari(keys, values),
                    /* const SizedBox(
                  height: 10,
                ),*/
                    const SizedBox(
                      height: 20,
                    ),
                    buton == true
                        ? const Text(
                            "Butona Bas - Kodu Kasalarımızdaki QR Okuyuculara Okut!",
                          )
                        : const Center(
                            child: Text(
                              "Lütfen Tüm Şartları Sağlayınız!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                    buton == true
                        ? Text(
                            "Hem Latte Çeşitlerimize ${kampanya.puan} Liraya Sahip Ol Hem de Tam ${kampanya.puan} Puan Kazan!",
                          )
                        : const SizedBox(
                            height: 0,
                            width: 0,
                          ),
                    Container(
                      height: buton == false
                          ? MediaQuery.of(context).size.width < 420
                              ? 100
                              : 0
                          : 0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        width: buton == true ? _qrmodel.width : 0,
                        height: buton == true ? _qrmodel.height : 0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 30, 59, 49),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            _qrmodel.QRGetir("asdf");
                          },
                          child: const Text("Fırsatı Yakala!"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: buton == true ? 15 : 0,
                    ),
                    _qrmodel.state == ViewState.gelmiyor
                        ? const SizedBox(
                            height: 0,
                          )
                        : _qrmodel.state == ViewState.geliyor
                            ? Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ],
                              )
                            : _qrmodel.state == ViewState.geldi
                                ? QROlustur(_qrmodel.id, context)
                                : const Text("Hata"),
                  ],
                ),
              ),
            )
            /* ],
            ),*/
          ]))
        ]));
  }

  kampanyaSartlari(List keys, List values) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                keys[index] + " :",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor:
                    values[index] == "+" ? Colors.green : Colors.red,
                child: values[index] == "+"
                    ? const Text(
                        "✓",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      )
                    : const Text(
                        "X",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
              ),
            ],
          ),
        );
      }),
      itemCount: kampanya.sartlar.length,
    );
  }

  QROlustur(String urunID, BuildContext context) {
    profileGit(context);
    return Center(
      child: Column(
        children: [
          QrImage(
            data: urunID,
            version: QrVersions.auto,
            size: 200.0,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            urunID,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Lütfen Ekranda Çıkan QR Kodu Kasalarımızdaki Okuyucuya Tutun!",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  profileGit(BuildContext context) async {
    QRViewModel _qrmodel = Provider.of<QRViewModel>(context, listen: true);
    UserViewModel _user = Provider.of<UserViewModel>(context, listen: false);

    _qrmodel.onayBekle().listen((event) async {
      if (event == "Onaylandı") {
        await _qrmodel.puanEkle();
        Navigator.pop(context);
        _user.userGetir("asdasda");
        Navigator.pushReplacementNamed(context, '/profil', arguments: {});
      }
    });
  }
}
