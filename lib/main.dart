import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:next_top_tech/core/res/theme.dart';
import 'package:next_top_tech/core/services/injection_container.dart';
import 'package:next_top_tech/core/services/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();

    return MaterialApp(
      title: 'MyShifo',
      theme: appTheme.lightTheme(),
      darkTheme: appTheme.darkTheme(),
      onGenerateRoute: generateRoute,
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
