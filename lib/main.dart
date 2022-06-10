import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:photofeed/app/app_module.dart';
import 'package:photofeed/app/app_widget.dart';
import 'package:photofeed/firebase_options.dart';

const host = '192.168.1.102';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* DefaultFirebaseOptions.currentPlatform is automatically generated by the 
  Flutterfire CLI*/
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kDebugMode) {
    await FirebaseAuth.instance.useAuthEmulator(host, 9099);
    await FirebaseStorage.instance.useStorageEmulator(host, 9199);
    FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
  }
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
