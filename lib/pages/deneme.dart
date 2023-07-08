import 'package:coffee_app/models/urun_model.dart';
import 'package:flutter/material.dart';

class Deneme extends StatelessWidget {
  final Urun urun;
  const Deneme({Key? key, required this.urun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List keys = [];
    List values = [];
    keys.addAll(urun.besinDegeri.keys);
    values.addAll(urun.besinDegeri.values);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 214, 181),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.brown),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(urun.resim), fit: BoxFit.contain),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          urun.adi,
                          style: const TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Text(
                          urun.fiyat + " TL",
                          style: const TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(urun.aciklama),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "İçindekiler",
                      style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(urun.icindekiler),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Alerjen Uyarısı",
                      style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(urun.alerjen),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Besin Değerleri",
                      style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    /*const SizedBox(
                              height: 5,
                            ),*/
                    besindegerleri(keys, values),
                    /* const SizedBox(
                      height: 10,
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  besindegerleri(List keys, List values) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(keys[index]), Text(values[index])],
          ),
        );
      }),
      itemCount: keys.length,
    );
  }
}
