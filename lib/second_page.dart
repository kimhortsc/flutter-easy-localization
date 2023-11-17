import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'generated/locale_keys.g.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Language: ${LocaleKeys.current_lang.tr()}',
            ),
            OutlinedButton (onPressed: (){
              final langCode = context.locale.languageCode;
              if(langCode == "en") {
                context.setLocale(const Locale('km', "KM"));
              } else {
                context.setLocale(const Locale('en', "US"));
              }
            }, child: const Text("Change language")),
          ],
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
