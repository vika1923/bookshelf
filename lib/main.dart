import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'bookshelf.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class PDFOpener extends StatelessWidget {
  const PDFOpener({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('$fileName'),
        ),
        body: SfPdfViewer.asset('assets/1984 - Full Text.pdf',
            pageLayoutMode: PdfPageLayoutMode.single),
      ),
    );
  }
}
