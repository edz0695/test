import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:payapp/src/src.dart';

class PdfViewerWidget extends StatelessWidget {
  const PdfViewerWidget(
      {super.key, required this.title, required this.filePath});
  final String title, filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 14),
        ),
        leading: back(),
        centerTitle: true,
      ),
      body: filePath.isEmpty
          ? Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: filePath,
              enableSwipe: true,
              autoSpacing: true,
              pageFling: true,
            ),
    );
  }
}
