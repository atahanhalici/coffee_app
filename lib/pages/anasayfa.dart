import 'package:coffee_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatelessWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: const CoffeeBottomNavigationBar(sayi: 0),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "assets/asset.jpg",
              fit: BoxFit.cover,
            ),
            title: const Text("Coffee App"),
            centerTitle: true,
          ),
          stretch: true,
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.width < 420 ? 300 : 180,
          toolbarHeight: 50,
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
                        "Merhaba Atahan :)",
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
                        "Bunlara Göz Attın Mı?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  oneCikanUrunler(),
                ],
              ),
            ),
          )
        ]))
      ]),
    );
  }

  oneCikanUrunler() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 255,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 260),
          itemBuilder: (context, index) {
            // CrossAxisAlignment.center;
            return Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 30, 59, 49),
                  borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () {},
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
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          height: 140,
                          width: 177,
                          child: Image.asset(
                            "assets/coffee.jpg",
                            fit: BoxFit.cover,
                          ),
                        )),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 5),
                          child: const SizedBox(
                            child: const Text("Blonde Latte",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: const Color.fromARGB(
                                        255, 231, 209, 186),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 5),
                          child: const SizedBox(
                            child: Text(
                                "Hafif kavrulmuş (yumuşak içimli) Starbucks Blonde® espresso, buharla ısıtılmış kadifemsi süt ve süt köpüğünün dengeli buluşması",
                                textAlign: TextAlign.start,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 10,
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
}
