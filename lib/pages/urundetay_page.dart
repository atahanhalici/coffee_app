import 'package:coffee_app/models/urun_model.dart';
import 'package:flutter/material.dart';

class UrunDetay extends StatelessWidget {
  final Urun urun;
  const UrunDetay({Key? key, required this.urun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List keys = [];
    List values = [];
    keys.addAll(urun.besinDegeri.keys);
    values.addAll(urun.besinDegeri.values);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 30, 59, 49),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                urun.resim,
                fit: BoxFit.contain,
              ),
            ),
            stretch: true,
            pinned: true,
            collapsedHeight: 50,
            expandedHeight: MediaQuery.of(context).size.width < 420 ? 300 : 200,
            backgroundColor: Colors.transparent,
            toolbarHeight: 50,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.brown, size: 25),
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
                          urun.adi,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Text(
                          urun.fiyat + " TL",
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
                    Text(urun.aciklama),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "İçindekiler",
                      style: TextStyle(
                          color: Colors.black,
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
                          color: Colors.black,
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
                          color: Colors.black,
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
            )
            /* ],
            ),*/
          ]))
        ]));
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
