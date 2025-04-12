import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import '../../../../../core/services/hiveDatabase.dart';
import '../../../../../themes/colors.dart';
import '../widgets/widgets.dart';

class ImageEditScreen extends StatefulWidget {
  final String baseImageUrl;

  const ImageEditScreen({super.key, required this.baseImageUrl});

  @override
  _ImageEditScreenState createState() => _ImageEditScreenState();
}

class _ImageEditScreenState extends State<ImageEditScreen> {
  final _editorKey = GlobalKey<ProImageEditorState>();
  late StreamController _updateAppBarStream;
  late Box box;

  @override
  void initState() {
    _updateAppBarStream = StreamController.broadcast();
    super.initState();
  }

  @override
  void dispose() {
    _updateAppBarStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ProImageEditor.network(
      widget.baseImageUrl,
      key: _editorKey,
      callbacks: ProImageEditorCallbacks(
        onImageEditingComplete: (Uint8List bytes) async {
          box = await HiveDataBase.openBox(boxName: "images");
          HiveDataBase.saveSingleItem(key: "image", box: box, data: bytes);
          Get.to(() => PreviewScreen(bytes: bytes));
        },
      ),
      configs: ProImageEditorConfigs(
        i18n: const I18n(
          various: I18nVarious(),
          paintEditor: I18nPaintingEditor(),
          textEditor: I18nTextEditor(),
          cropRotateEditor: I18nCropRotateEditor(),
          filterEditor: I18nFilterEditor(filters: I18nFilters()),
          emojiEditor: I18nEmojiEditor(),
          stickerEditor: I18nStickerEditor(),
        ),
        helperLines: const HelperLines(
          showVerticalLine: true,
          showHorizontalLine: true,
          showRotateLine: true,
          hitVibration: true,
        ),
        imageEditorTheme: const ImageEditorTheme(
          helperLine: HelperLineTheme(
            horizontalColor: Color(0xFF1565C0),
            verticalColor: Color(0xFF1565C0),
            rotateColor: Color(0xFFE91E63),
          ),
          paintingEditor: PaintingEditorTheme(),
          textEditor: TextEditorTheme(),
          cropRotateEditor: CropRotateEditorTheme(),
          filterEditor: FilterEditorTheme(),
          emojiEditor: EmojiEditorTheme(),
          stickerEditor: StickerEditorTheme(),
          background: Color.fromARGB(255, 22, 22, 22),
          uiOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0x42000000),
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: Color(0xFF000000),
          ),
        ),
        icons: const ImageEditorIcons(
          paintingEditor: IconsPaintingEditor(),
          textEditor: IconsTextEditor(),
          cropRotateEditor: IconsCropRotateEditor(),
          filterEditor: IconsFilterEditor(),
          emojiEditor: IconsEmojiEditor(),
          stickerEditor: IconsStickerEditor(),
          closeEditor: Icons.clear,
          doneIcon: Icons.done,
          applyChanges: Icons.done,
          backButton: Icons.arrow_back,
          undoAction: Icons.undo,
          redoAction: Icons.redo,
          removeElementZone: Icons.delete_outline_rounded,
        ),
        paintEditorConfigs: const PaintEditorConfigs(),
        textEditorConfigs: const TextEditorConfigs(),
        cropRotateEditorConfigs: const CropRotateEditorConfigs(),
        filterEditorConfigs: const FilterEditorConfigs(),
        emojiEditorConfigs: const EmojiEditorConfigs(),
        stickerEditorConfigs: StickerEditorConfigs(
          enabled: true,
          buildStickers: (setLayer, scrollController) {
            return
                // _pickedFile != null
                //     ? GestureDetector(
                //         onTap: () => setLayer(iamge),
                //         child: MouseRegion(
                //             cursor: SystemMouseCursors.click,
                //             child: GestureDetector(
                //               onTap: () => setLayer(iamge),
                //               child: MouseRegion(
                //                 cursor: SystemMouseCursors.click,
                //                 child: iamge,
                //               ),
                //             )),
                //       )
                //     :
                ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Container(
                color: const Color.fromARGB(255, 224, 239, 251),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton.filled(
                        onPressed: () async {
                          try {
                            final image = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              setState(() {
                                setLayer(Image.file(File(image.path),
                                    width: 300, height: 400));
                              });
                            }
                          } catch (e) {
                            debugPrint('Failed to pick image: $e');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColors.darkBlueColor,
                            foregroundColor: Colors.white),
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: 21,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Widget widget = ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Image.network(
                              'https://picsum.photos/id/${(index + 3) * 3}/2000',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          );
                          return GestureDetector(
                            onTap: () => setLayer(widget),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: widget,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        designMode: ImageEditorDesignModeE.material,
        heroTag: 'hero',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue.shade800,
            brightness: Brightness.dark,
          ),
        ),
      ),
    ));
  }
}
