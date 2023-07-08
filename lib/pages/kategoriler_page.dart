import 'package:coffee_app/pages/urunler_page.dart';
import 'package:coffee_app/view_models/kategori_view_model.dart';
import 'package:coffee_app/view_models/urunler_view_model.dart';
import 'package:coffee_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Kategoriler extends StatelessWidget {
  const Kategoriler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KategoriViewModel _kategoriler =
        Provider.of<KategoriViewModel>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 30, 59, 49),
          centerTitle: true,
          title: const Text("Kategoriler"),
        ),
        bottomNavigationBar: const CoffeeBottomNavigationBar(
          sayi: 1,
        ),
        body: _kategoriler.state == ViewState.geldi
            ? KategorilerGeldi(context)
            : _kategoriler.state == ViewState.geliyor
                ? KategorilerGetiriliyor()
                : const Text("Hata"));
  }

  // ignore: non_constant_identifier_names
  KategorilerGeldi(BuildContext context) {
    KategoriViewModel _kategoriler =
        Provider.of<KategoriViewModel>(context, listen: true);
    UrunlerViewModel _urunler =
        Provider.of<UrunlerViewModel>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: ListView.builder(
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              _urunler.urunleriGetir();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UrunlerPage(
                  adi: _kategoriler.asd[index].adi,
                ),
              ));
            },
            child: Container(
                margin: const EdgeInsets.only(bottom: 15, left: 5, right: 5),
                height: 80,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 30, 59, 49),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      foregroundImage:
                          NetworkImage(_kategoriler.asd[index].icon),
                      backgroundColor: const Color.fromARGB(255, 30, 59, 49),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          _kategoriler.asd[index].adi,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )
                  ],
                ) /*ListTile(
                title: Text(_kategoriler.asd[index].adi),
                leading: CircleAvatar(
                    foregroundImage:
                        NetworkImage(_kategoriler.asd[index].icon)),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),*/
                ),
          );
        }),
        itemCount: _kategoriler.asd.length,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  KategorilerGetiriliyor() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
