import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payapp/src/src.dart';
import 'package:http/http.dart' as http;

import '../widgets/pdf_viewer_widget.dart';

class ShortNotesTab extends StatelessWidget {
  const ShortNotesTab({super.key, required this.chapterId});

  final String chapterId;

  @override
  Widget build(BuildContext context) {
    final EducationController controller = Get.find<EducationController>();
    controller.fetchNotes(chapterId);
    return Obx(() {
      final notes = controller.shortNotes.value?.data ?? [];
      return controller.isLoadingVideoNotes.value
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : notes.isEmpty
              ? Center(
                  child: Text(
                    "Short notes not found",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                )
              : GridView.builder(
                  itemBuilder: (context, index) {
                    final note = notes[index].note!.first;
                    return buildNotesContainer(
                        note: note.title.toString(),
                        context: context,
                        pdfUrl: note.url.toString());
                  },
                  itemCount: notes.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                );
    });
  }
}

String localPath = '';
Future<void> _downloadPdf(String url, String name) async {
  try {
    // Fetch PDF file from URL
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    // Get the directory to store the PDF
    final dir = await getApplicationDocumentsDirectory();
    localPath = '${dir.path}/$name.pdf';

    // Write the bytes to the local file
    final file = File(localPath);
    await file.writeAsBytes(bytes);
  } catch (e) {
    // Handle errors here
    printThis('Error downloading PDF: $e');
  }
}

buildNotesContainer(
    {required String note,
    required String pdfUrl,
    required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: const Color(0xffBBDEFB),
            borderRadius: BorderRadius.circular(20),
          ),
          width: double.infinity,
          child: Image.asset(
            'assets/logo.png',
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
        ),
        height(3),
        Text(
          note,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: ThemeColors.darkBlueColor,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton.icon(
          onPressed: () async => await _downloadPdf(pdfUrl, note)
              .then((value) => Get.to(() => PdfViewerWidget(
                    filePath: localPath,
                    title: note,
                  ))),
          icon: const Icon(
            Icons.download,
          ),
          label: const Text('Download'),
        ),
      ],
    ),
  );
}
