import 'package:flutter/material.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';


class TermsAndConditionsScreen extends StatelessWidget {
  final String termsConditions;
  final String title;
  const TermsAndConditionsScreen({super.key,required this.termsConditions,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: title,size: 55,),
      body: termsConditions.isEmpty?const Center(child: Text("Not Available",style: TextStyle(color: Colors.black,fontSize: 20),),):SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical:10),
          child: Column(
            children: [
              Text(termsConditions,
                style: const TextStyle(color: Colors.black,fontSize: 16,height: 1.5),
                softWrap: true,textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
