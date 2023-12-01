/* import 'package:algolia/algolia.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jiffy/jiffy.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:logging/logging.dart';


class Configs {
  static Algolia? algolia;

  Configs._();

  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    //initStripe();
    await Firebase.initializeApp();
    await Jiffy.locale('fr');
  }


  static String documentPath = '';
  static GlobalKey<AnimatedListState> audioListKey = GlobalKey<AnimatedListState>();



}
 */