import 'package:coffee_app/locator.dart';
import 'package:coffee_app/route_generator.dart';
import 'package:coffee_app/view_models/kampanyalar_view_model.dart';
import 'package:coffee_app/view_models/qr_model.dart';
import 'package:coffee_app/view_models/urunler_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/anasayfa.dart';
import 'view_models/kategori_view_model.dart';
import 'view_models/user_view_model.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => KategoriViewModel()),
    ChangeNotifierProvider(create: (_) => UrunlerViewModel()),
    ChangeNotifierProvider(create: (_) => UserViewModel()),
    ChangeNotifierProvider(create: (_) => KampanyalarViewModel()),
    ChangeNotifierProvider(
      create: (_) => QRViewModel(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color.fromARGB(255, 30, 59, 49),
      ),
      home: const MyHomePage(),
      onGenerateRoute: RouteGenerator.rotaOlustur,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Anasayfa();
  }
}
