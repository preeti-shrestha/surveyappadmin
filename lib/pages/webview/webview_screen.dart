import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebviewScreen extends StatefulWidget {
  final String link;

  const WebviewScreen({super.key,required this.link});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  WebViewController controller=WebViewController();
  @override
  void initState() {
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse('$widget.link'));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
