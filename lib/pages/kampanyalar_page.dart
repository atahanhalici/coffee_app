import 'package:coffee_app/pages/puan_kazan_page.dart';
import 'package:coffee_app/view_models/kampanyalar_view_model.dart';
import 'package:coffee_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KampanyalarPage extends StatelessWidget {
  const KampanyalarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KampanyalarViewModel _kampanyalar =
        Provider.of<KampanyalarViewModel>(context, listen: true);
    return Scaffold(
      bottomNavigationBar: const CoffeeBottomNavigationBar(
        sayi: 2,
      ),
      backgroundColor: const Color.fromARGB(255, 209, 171, 135),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "assets/kampanya.png",
              fit: BoxFit.cover,
            ),
            centerTitle: true,
            title: const Text("Kampanyalar"),
          ),
          stretch: true,
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.width < 420 ? 300 : 200,
          backgroundColor: const Color.fromARGB(255, 30, 59, 49),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 8.0, right: 8, top: 10, bottom: 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sizin İçin Özel Kampanyalar",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 8.0,
                      right: 8,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hepsi ve Daha Fazlası Bir Tık Uzağında!",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  _kampanyalar.state == ViewState.geldi
                      ? KampanyalarGeldi(context)
                      : _kampanyalar.state == ViewState.geliyor
                          ? KampanyalarGetiriliyor()
                          : const Text("Hata"),
                  Visibility(
                      visible:
                          _kampanyalar.state == ViewState.geldi ? false : true,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            color: Colors.white,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          )
        ]))
      ]),

      /* */
    );
  }

  KampanyalarGeldi(BuildContext context) {
    KampanyalarViewModel _kampanyalar =
        Provider.of<KampanyalarViewModel>(context, listen: true);
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _kampanyalar.asd.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 255,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 260),
          itemBuilder: (context, index) {
            // CrossAxisAlignment.center;
            return GestureDetector(
              onTap: () {
                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PuanKazan(
                              kampanya: _kampanyalar.asd[index],
                            )),
                  );*/
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PuanKazan(
                            kampanya: _kampanyalar.asd[index],
                          )),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 30, 59, 49),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  //  decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                              margin: const EdgeInsets.only(top: 23),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              // height: 200,
                              width: 177,
                              child: SizedBox(
                                height: 120,
                                width: 120,
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/logoufak.png',
                                  image: _kampanyalar.asd[index].resim,
                                  fit: BoxFit.cover,
                                  placeholderFit: BoxFit.contain,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 5),
                          child: SizedBox(
                            child: Text(
                                //"URUN",
                                _kampanyalar.asd[index].adi,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 231, 209, 186),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 5),
                          child: SizedBox(
                            child: Text(_kampanyalar.asd[index].aciklama,
                                textAlign: TextAlign.start,
                                //maxLines: 1,
                                // overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  KampanyalarGetiriliyor() {
    return const Padding(
      padding: EdgeInsets.only(top: 150),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
