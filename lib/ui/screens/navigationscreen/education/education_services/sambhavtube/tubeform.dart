import 'dart:io';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/provider/education_providers/education_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../../../../../models/sambhavtubemodel.dart';

class TubeForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TubeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EductionFormProvider(),
      child: Scaffold(
          appBar: const AppBarWidget(
            title: "Add SambhavTube",
            size: 55,
          ),
          body: Consumer<EductionFormProvider>(
              builder: (context, provider, child) {
            return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        provider.updateTubeFormData(SambhavTubeModel(
                          id: '',
                          user_id: '9',
                          title: value!,
                          description: provider.formData.description,
                          video: provider.formData.video,
                          thumbnail: provider.formData.thumbnail,
                          tubecategory_id: provider.formData.tubecategory_id,
                          user_logo: '',
                          user_name: '',
                          likes: '',
                          views: '',
                        ));
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final picker = ImagePicker();
                        final pickedFile =
                            await picker.pickImage(source: ImageSource.gallery);

                        if (pickedFile != null) {
                          provider.updateTubeFormData(SambhavTubeModel(
                            id: '',
                            user_id: '9',
                            title: provider.formData.title,
                            description: provider.formData.description,
                            video: provider.formData.video,
                            thumbnail: pickedFile.path,
                            tubecategory_id: provider.formData.tubecategory_id,
                            user_logo: '',
                            user_name: '',
                            likes: '',
                            views: '',
                          ));
                        }
                      },
                      child: const Text('Select Thumbnail Image'),
                    ),
                    const SizedBox(height: 20),
                    if (provider.formData.thumbnail.isNotEmpty)
                      SizedBox(
                        height: 200,
                        child: Image.file(File(provider.formData.thumbnail)),
                      ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final result = await ImagePicker()
                            .pickVideo(source: ImageSource.gallery);

                        if (result != null) {
                          final file = result.path;
                          provider.updateTubeFormData(SambhavTubeModel(
                            id: '',
                            user_id: '9',
                            title: provider.formData.title,
                            description: provider.formData.description,
                            video: file,
                            thumbnail: provider.formData.thumbnail,
                            tubecategory_id: provider.formData.tubecategory_id,
                            user_logo: '',
                            user_name: '',
                            likes: '',
                            views: '',
                          ));
                        }
                      },
                      child: const Text('Upload Video'),
                    ),
                    const SizedBox(height: 20),
                    if (provider.formData.video.isNotEmpty)
                      SizedBox(
                        height: 200,
                        child: VideoPlayer(_getVideoPlayer(provider)),
                      ),
                    const SizedBox(height: 20),
                    // DropdownButtonFormField(
                    //   decoration: InputDecoration(
                    //     labelText: 'Category',
                    //   ),
                    //   value: provider.formData.categoryId,
                    //   onChanged: (categoryId) {
                    //     provider.updateFormData(FormData(
                    //       title: provider.formData.title,
                    //       description: provider.formData.description,
                    //       videoFile: provider.formData.videoFile,
                    //       thumbnailImage: provider.formData.thumbnailImage,
                    //       categoryId: categoryId as int?,
                    //     ));
                    //   },
                    //   items: Provider.of<FormProvider>(context)
                    //       .categories
                    //       .map<DropdownMenuItem<int>>((category) {
                    //     return DropdownMenuItem<int>(
                    //       value: category.id,
                    //       child: Text(category.name),
                    //     );
                    //   }).toList(),
                    // ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          printThis(provider.formData.toString());
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Form submitted successfully!'),
                            ),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ));
          })),
    );
  }
}

VideoPlayerController _getVideoPlayer(EductionFormProvider provider) {
  if (provider.videoPlayerController.dataSource != provider.formData.video) {
    provider.videoPlayerController.dispose();
    provider.videoPlayerController =
        VideoPlayerController.file(File(provider.formData.video));
  }

  return provider.videoPlayerController;
}
