import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/data/local_db/alamat_pribadi_local.dart';
import 'app/data/local_db/informasi_perusahaan.dart';
import 'app/data/local_db/local_profile.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileInformationAdapter());
  await Hive.openBox<ProfileInformation>('profileBox');

  Hive.registerAdapter(AlamatPribadiAdapter());
  await Hive.openBox<AlamatPribadi>('alamatBox');
  Hive.registerAdapter(InformasiPerusahaanAdapter());
  await Hive.openBox<InformasiPerusahaan>('informasiPerusahaanBox');

  runApp(
    GetMaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.amber,
          onPrimary: Colors.white,
          secondary: Colors.amberAccent,
          onSecondary: Colors.black,
        ),
      ),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
