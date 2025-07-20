import 'package:flutter/material.dart';

class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    debugPrint("Observer added");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    debugPrint("Observer remove");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('AppLifecycleState changed to $state');
    if (state == AppLifecycleState.resumed) {
      print('App is visible and interactive');
    } else if (state == AppLifecycleState.paused) {
      print('App is in background');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lifecycle Example")),
      body: Center(child: Text("Watch console for lifecycle changes")),
    );
  }
}
