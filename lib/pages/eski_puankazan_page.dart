import 'package:coffee_app/models/kampanya_model.dart';
import 'package:coffee_app/view_models/qr_model.dart';
import 'package:coffee_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EskiPuanKazan extends StatelessWidget {
  final Kampanya kampanya;
  const EskiPuanKazan({Key? key, required this.kampanya}) : super(key: key);

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
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 128, 20, 0),
          centerTitle: true,
          title: const Text("Coffee App"),
        ),
        bottomNavigationBar: const CoffeeBottomNavigationBar(
          sayi: 2,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 8,
              ),
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    foregroundImage: NetworkImage(kampanya.resim),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  kampanya.adi,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Text(
                kampanya.puan + " Puan",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  kampanya.aciklama,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 5, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            keys[index] + " :",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: values[index] == "+"
                                ? Colors.green
                                : Colors.red,
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
                          )
                        ],
                      ),
                    );
                  }),
                  itemCount: kampanya.sartlar.length,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: buton == true
                      ? const Text(
                          "Butona Bas - Kodu Kasalarımızdaki QR Okuyuculara Okut!",
                          textAlign: TextAlign.center,
                        )
                      : const Text(
                          "Lütfen Tüm Şartları Sağlayınız!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: buton == true
                      ? Text(
                          " Hem Latte Çeşitlerimize ${kampanya.puan} Liraya Sahip Ol Hem de Tam ${kampanya.puan} Puan Kazan",
                          textAlign: TextAlign.center,
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        )),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: buton == true ? _qrmodel.width : 0,
                height: buton == true ? _qrmodel.height : 0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 128, 20, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    _qrmodel.QRGetir("asdf");
                  },
                  child: const Text("Fırsatı Yakala!"),
                ),
              ),
              const SizedBox(
                height: 15,
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
        ));
  }

/* SizedBox(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _qrmodel.state == ViewState.geldi
                ? QROlustur(_qrmodel.id)
                : _qrmodel.state == ViewState.geliyor
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Text("Hata"),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Lütfen Ekranda Çıkan QR Kodu Kasalarımızdaki Okuyucuya Tutun!"),
            )
          ],
        ),
      ),*/
  // ignore: non_constant_identifier_names
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
    _qrmodel.onayBekle().listen((event) async {
      if (event == "Onaylandı") {
        await _qrmodel.puanEkle();
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, '/profil', arguments: {});
      }
    });
  }
}
