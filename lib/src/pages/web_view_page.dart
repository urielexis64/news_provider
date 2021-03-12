import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:webview_flutter/webview_flutter.dart';

import 'package:news_provider/src/models/news_models.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final Article news = ModalRoute.of(context).settings.arguments;

    final snackBar = SnackBar(
        duration: Duration(seconds: 2),
        elevation: 10,
        backgroundColor: Colors.grey[900],
        action: SnackBarAction(
            textColor: Colors.white,
            label: 'OK',
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
        content: Text(
          'URL copiada!',
          style: TextStyle(color: Colors.white),
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text(news.source.name),
        actions: [
          IconButton(
              icon: Icon(Icons.copy),
              tooltip: 'Copiar URL',
              onPressed: () {
                Clipboard.setData(new ClipboardData(text: news.url));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),
          IconButton(
              tooltip: 'Abrir en el navegador',
              icon: Icon(Icons.public),
              onPressed: () => _launchURL(news.url)),
        ],
      ),
      body: WebView(
        initialUrl: news.url,
        gestureNavigationEnabled: true,
      ),
    );
  }
}

void _launchURL(String url) async {
  await url_launcher.canLaunch(url)
      ? await url_launcher.launch(url)
      : throw 'Could not launch $url';
}
