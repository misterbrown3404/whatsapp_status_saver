import 'package:flutter/material.dart';
//import 'package:whatsapp_status_saver/generated/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
export  'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
