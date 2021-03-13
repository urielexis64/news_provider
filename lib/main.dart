import 'package:flutter/material.dart';
import 'package:news_provider/src/pages/tabs_page.dart';
import 'package:news_provider/src/pages/web_view_page.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:news_provider/src/shared_prefs/user_preferences.dart';
import 'package:news_provider/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsService())],
      child: MaterialApp(
        title: 'Material App',
        theme: MyTheme.myTheme,
        debugShowCheckedModeBanner: false,
        home: TabsPage(),
        initialRoute: 'tabspage',
        routes: {
          'tabspage': (BuildContext context) => TabsPage(),
          'webview': (BuildContext context) => WebViewPage(),
        },
      ),
    );
  }
}
