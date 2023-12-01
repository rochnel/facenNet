import 'package:face_net_authentication/presentation/app.dart';
import 'package:face_net_authentication/presentation/controllers/login/form_binding_login.dart';
import 'package:face_net_authentication/presentation/pages/personnels/FaceID/locator.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';


void main() async {
      setupServices();
                                                               
  final binding = WidgetsFlutterBinding.ensureInitialized();
  binding.addPostFrameCallback((_) async {
    // ignore: deprecated_member_use, unused_local_variable
    BuildContext context = binding.renderViewElement as BuildContext;
  });
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
   FormLoginBinding().dependencies();
  initializeDateFormatting().then((_) => runApp(EmpFac()));
}
