import 'package:dis_pred/config/routes/approute.dart';
import 'package:dis_pred/core/cache/cache_services.dart';
import 'package:dis_pred/features/authentication/domain/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheServices.getCacheServicesInstance.initPreferences();
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
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => LoginViewModel())],
        builder: (context, child) {
          return MaterialApp(
            onGenerateRoute: AppRoute().ongenerateRoute,
          );
        });
  }
}
