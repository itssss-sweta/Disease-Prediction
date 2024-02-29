import 'package:dis_pred/config/routes/approute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(const MyApp());
  });
}

//ref:UI source:https://www.figma.com/file/s5fa12o3bzEuPsSE6p7tCY/Medics---Medical-App-UI-Kit-(Community)?type=design&node-id=4-1107&mode=design&t=foVvWunaDWPQC6CL-0

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoute().ongenerateRoute,
    );
  }
}
