import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension AppLocalizationsHelper on BuildContext {
  AppLocalizations get l {
    return AppLocalizations.of(this)!;
  }
}

extension ArgumentsHelper on BuildContext {
  Object? get args {
    return ModalRoute.of(this)!.settings.arguments;
  }
}

extension BrightnessHelper on BuildContext {
  bool get darkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}

extension TextThemeHelper on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }
}
