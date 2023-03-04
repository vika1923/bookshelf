import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

File file = File("assets/1984 - Full Text.pdf");
String fileName = file.path.split('/').last;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final BooksNumber = 20;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widget = List.generate(
        BooksNumber,
        (index) => Container(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PDFOpener()));
                  },
                  child: Text("Read")),
            ));

    return Scaffold(
      appBar: AppBar(
        title: Text("Bookshelf"),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: _widget
              .map((e) => ExpansionPanelRadio(
                  value: e,
                  headerBuilder: (BuildContext context, bool isExpanded) =>
                      ListTile(
                        title: Text('$fileName'),
                      ),
                  body: e))
              .toList(),
        ),
      ),
    );
  }
}
