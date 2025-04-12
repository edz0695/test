import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:share/share.dart';
import '../../../../../config/apiconfig.dart';
import '../../../../../core/animations/dot_loder_widget.dart';
import '../../../../../provider/earn_providers/earn_screen_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../../themes/colors.dart';

class ShareMediaTab extends StatelessWidget {
  const ShareMediaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EarnScreenProvider>(
        builder: (context, earnScreenProvider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Text(
              'Photos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return earnScreenProvider
                    .getOfferDetails(earnScreenProvider.offer!.id);
              },
              color: ThemeColors.primaryBlueColor,
              child: earnScreenProvider.offer == null
                  ? const Center(
                      child: KSProgressAnimation(
                        dotsColor: ThemeColors.primaryBlueColor,
                      ),
                    )
                  : GridView.builder(
                      itemCount: earnScreenProvider.offer!.shareMedia.length,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: (1 / 1.3),
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(3, 3),
                                color: const Color(0xff2057A6).withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                  child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Image.network(
                                  Constants.forImg +
                                      earnScreenProvider
                                          .offer!.shareMedia[index]
                                          .toString(),
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                ),
                              )),
                              IntrinsicHeight(
                                child: SizedBox(
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final imageUrl =
                                                  Constants.baseUrl +
                                                      earnScreenProvider.offer!
                                                          .shareMedia[index]
                                                          .toString();
                                              final url = Uri.parse(imageUrl);
                                              final response =
                                                  await http.get(url);
                                              final bytes = response.bodyBytes;
                                              final temp =
                                                  await getTemporaryDirectory();
                                              final path =
                                                  '${temp.path}/image.jpg';
                                              File(path)
                                                  .writeAsBytesSync(bytes);
                                              Share.shareXFiles(
                                                [XFile(path)],
                                                // [path],
                                                text: earnScreenProvider
                                                    .offer!.shareLink,
                                                subject: 'DivTag Apps Link',
                                              );

                                              // WhatsappShare.shareFile(filePath: [path], phone: "",text:"${earnScreenProvider.offer["offer"]["share_url"]}" );
                                              // var url2 = "whatsapp://send?text= ${earnScreenProvider.offer["offer"]["share_url"]}";
                                              // Uri encoded = Uri.parse(url2);
                                              //
                                              // await launchUrl(encoded);
                                            },
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10)),
                                            child: const Center(
                                                child: Image(
                                              image: AssetImage(
                                                  'assets/icons/whatsapp.png'),
                                              height: 20,
                                            ))),
                                      )),
                                      const VerticalDivider(
                                        thickness: 1,
                                        width: 0,
                                      ),
                                      Expanded(
                                          child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final imageUrl = Constants.baseUrl +
                                                earnScreenProvider
                                                    .offer!.shareMedia[index]
                                                    .toString();
                                            final url = Uri.parse(imageUrl);
                                            final response =
                                                await http.get(url);
                                            final bytes = response.bodyBytes;
                                            final temp =
                                                await getTemporaryDirectory();
                                            final path =
                                                '${temp.path}/image.jpg';
                                            File(path).writeAsBytesSync(bytes);
                                            Share.shareXFiles([XFile(path)],
                                                text: earnScreenProvider
                                                    .offer!.shareLink,
                                                subject: 'DivTag Apps Link');
                                          },
                                          borderRadius: const BorderRadius.only(
                                              bottomRight: Radius.circular(10)),
                                          child: const Center(
                                              child: Icon(
                                            Icons.share,
                                            size: 20,
                                            color: Colors.blue,
                                          )),
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      );
    });
  }
}
