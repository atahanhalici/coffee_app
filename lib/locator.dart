import 'package:coffee_app/models/kampanya_model.dart';
import 'package:coffee_app/pages/puan_kazan_page.dart';
import 'package:coffee_app/services/kategori_service.dart';
import 'package:get_it/get_it.dart';
import 'repository/kategori_repo.dart';

final locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => KategorilerRepo());
  locator.registerLazySingleton(() => KategoriService());
  locator.registerLazySingleton(() => PuanKazan(
      kampanya:
          Kampanya(adi: "", resim: "", aciklama: "", sartlar: {}, puan: "")));
}
