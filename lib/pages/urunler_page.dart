import 'package:coffee_app/pages/deneme.dart';
import 'package:coffee_app/pages/urundetay_page.dart';
import 'package:coffee_app/view_models/urunler_view_model.dart';
import 'package:coffee_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UrunlerPage extends StatelessWidget {
  final String adi;
  const UrunlerPage({Key? key, required this.adi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UrunlerViewModel _urunler =
        Provider.of<UrunlerViewModel>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 30, 59, 49),
          centerTitle: true,
          title: Text(adi),
        ),
        bottomNavigationBar: const CoffeeBottomNavigationBar(
          sayi: 1,
        ),
        body: _urunler.state == ViewStates.geldi
            ? urunlerGeldi(context)
            : _urunler.state == ViewStates.geliyor
                ? urunlerGetiriliyor()
                : const Text("Hata"));
  }

  urunlerGeldi(BuildContext context) {
    UrunlerViewModel _urunler =
        Provider.of<UrunlerViewModel>(context, listen: true);
    return ListView.builder(
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  UrunDetay(urun: _urunler.asd[index]),
            ));
          },
          child: Container(
            margin: EdgeInsets.only(top: 10, right: 10, left: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 30, 59, 49),
            ),
            child: ListTile(
              title: Text(_urunler.asd[index].adi),
              textColor: Colors.white,
              iconColor: Colors.white,
              leading: CircleAvatar(
                foregroundImage: NetworkImage(_urunler.asd[index].resim),
                backgroundColor: const Color.fromARGB(255, 30, 59, 49),
              ),
              subtitle: Text(_urunler.asd[index].aciklama),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        );
      }),
      itemCount: _urunler.asd.length,
    );
  }

  // ignore: non_constant_identifier_names
  urunlerGetiriliyor() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
