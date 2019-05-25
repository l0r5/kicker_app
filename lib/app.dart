import 'package:flutter/material.dart';

import 'landing_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kicker App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kicker App'),
        ),
        body: LandingPage(),
      ),
    );
  }
}
