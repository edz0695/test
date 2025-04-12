import 'package:flutter/material.dart';
import 'package:payapp/config/apiconfig.dart';
import 'package:payapp/models/community_model.dart';
import 'package:payapp/themes/colors.dart';



class CommunityPostWidget extends StatelessWidget {
  final CommunityPoPosts post;
  final Function()? onTap;
  const CommunityPostWidget({super.key, required this.post,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          splashColor: ThemeColors.primaryBlueColor.withOpacity(.05),
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(20),

          onTap: onTap,

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 131, 140, 223).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Wrap(
              children: <Widget>[
                // if(){

                // }
                post.image != ''?Image(image: NetworkImage('${Constants.forImg}/${post.image}')):const SizedBox(),
                Text(post.post,style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05,),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
