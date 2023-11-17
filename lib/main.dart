import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy_localisation/generated/locale_keys.g.dart';
import 'package:flutter_easy_localisation/second_page.dart';

Future<void> main() async {
  // Needs to be called so that we can await for EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('km', 'KM')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en', 'US'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Localization',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Easy Localization'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Current Language: ${LocaleKeys.current_lang.tr()}',
          ),
          Text(
            LocaleKeys.hello.tr(),
            style: const TextStyle(fontSize: 24),
          ),

          TextButton(onPressed: (){
            final langCode = context.locale.languageCode;
            if(langCode == "en") {
              context.setLocale(const Locale('km', "KM"));
            } else {
              context.setLocale(const Locale('en', "US"));
            }
          }, child: const Text("Change language")),
          const Padding(padding: EdgeInsets.only(top: 32)),
          const Divider(
            indent: 24,
            endIndent: 24,
          ),
          TextButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondPage()),
            );
          }, child: const Text("Go to Second Page")),
        ],
      ),
    );
  }
}
