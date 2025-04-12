import 'package:flutter/material.dart';
import 'package:payapp/data.dart';
import 'package:payapp/widgets/video_card.dart';
import 'package:provider/provider.dart';

import '../../../../../../../provider/education_providers/community_provider.dart';


class PostImageConsumer extends StatelessWidget {
  const PostImageConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunityProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Visibility(
              visible: provider.imageFile != null ? true : false,
              replacement:     Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color:Color(0xff184070),width:1),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                offset: Offset(0, 10),
                blurRadius: 20,
              ),
            ],
          ),
                child:Center(child:GestureDetector(
                    onTap:()async{
                      await provider.pickCameraPostImages();
                    },
                    child: Icon(Icons.add,color:Color(0xff184070),size:20)))
        ),
              child: TextButton(
                  onPressed: () => provider.clearImageFile(),
                  child: const Text('Cancel')),
            ),
            Visibility(
              visible: provider.imageFile != null ? true : false,
              replacement: const SizedBox(),
              child: Builder(builder: (context) {
                if (provider.imageFile != null) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Image.file(provider.imageFile!),
                  );
                } else {
                  return Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                     borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x14000000),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  );
                }
              }),
            ),
          ],
        );
      },
    );
  }
}

class PostVideoConsumer extends StatelessWidget {
  const PostVideoConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunityProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Visibility(
              visible: provider.videoFile != null ? true : false,
              replacement: const SizedBox(),
              child: TextButton(
                  onPressed: () => provider.clearVideoFile(),
                  child: const Text('Cancel')),
            ),
            Visibility(
              visible: provider.videoFile != null ? true : false,
              replacement: const SizedBox(),
              child: Builder(builder: (context) {
                if (provider.videoFile != null) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: VideoCard(video: videos[0]),
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ),
          ],
        );
      },
    );
  }
}
