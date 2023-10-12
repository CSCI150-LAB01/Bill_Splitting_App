import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/authentication_controller.dart';
import '../services/authentication_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

//Experiment----
  //TestDatabase testDatabase = TestDatabase();
  //testDatabase.FooBill0();
  //testDatabase.barBill0();
//--------------

  // runApp(const MockUpPage());
  // runApp(const FigmaToCodeApp());
  runApp(const SplitItApp());
}

class SplitItApp extends StatelessWidget {
  const SplitItApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'SplitIt',
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFF26B645),
          useMaterial3: true,
        ),
        home: StreamProvider.value(
          value: AuthenticationService().hahaha,
          initialData: null,
          child: const AuthenticationController(),
        ),
      );
}
