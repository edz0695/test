import 'package:flutter/material.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PickedMedia extends StatefulWidget {
  const PickedMedia({super.key});

  @override
  State<PickedMedia> createState() => _PickedMediaState();
}

class _PickedMediaState extends State<PickedMedia> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      replacement: const SizedBox(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        child: Image.file(
          File('path'),
        ),
      ),
    );
  }
}

class PermissionHandlerWidget extends StatefulWidget {
  // At this class I was trying to get the permission of storage and
  // display the media

  const PermissionHandlerWidget({super.key});

  static Widget _buildMediaWidget() {
    return FutureBuilder(
      future: _getRecentImages(),
      builder: (BuildContext context, AsyncSnapshot<List<File>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          printThis('number of bytes received: ${snapshot.data!.length}');
          return Column(
            children: List.generate(
              snapshot.data!.length,
              (index) => Image(
                image: FileImage(
                  snapshot.data![index],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  static Future<List<File>> _getRecentImages() async {
    List<File> images = [];
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    printThis('file picked is:${file!.path}');
    Directory? appDocDir =
        Directory('/data/user/0/com.sambhavapps.sambhav/cache');
    printThis(appDocDir.path);
    List<FileSystemEntity> files = Directory(appDocDir.path).listSync();
    printThis('number of files found:${files.length}');
    // Sort files by modification date to get the most recent ones
    // files
    //     .sort((a, b) => b.statSync().modified.compareTo(a.statSync().modified));

    files.map((e) => images.add(File(e.path)));
    // Display up to the last 20 images
    // for (int i = 0; i < files.length && i < 20; i++) {
    //   if (files[i].path.endsWith('.jpg')||files[i].path.endsWith('.png')) {
    //     printThis(files[i].path);
    //     images.add(File(files[i].path));
    //   }
    // }

    return images;
  }

  @override
  State<PermissionHandlerWidget> createState() =>
      _PermissionHandlerWidgetState();
}

class _PermissionHandlerWidgetState extends State<PermissionHandlerWidget> {
  Future<void> _requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
  }

  @override
  void initState() {
    printThis('Permission Handler is trying to request permission for media');
    _requestPermission();
    PermissionHandlerWidget._getRecentImages();
    PermissionHandlerWidget._buildMediaWidget();

    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      PermissionHandlerWidget._buildMediaWidget();
}
