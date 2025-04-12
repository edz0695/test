import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../config/apiconfig.dart';
import '../../../../../../provider/education_providers/education_provider.dart';
import '../../../../../../provider/setingsProvider.dart';
import '../../../../../widgets/app_bar_widget.dart';



class TeacherDetails extends StatefulWidget {
  final String id;
  const TeacherDetails({super.key,required this.id});

  @override
  State<TeacherDetails> createState() => _TeacherDetailsState();
}

class _TeacherDetailsState extends State<TeacherDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final tutorProvider = Provider.of<EductionFormProvider>(context,listen: false);
    tutorProvider.getTeacherSlots(userId: widget.id);
    tutorProvider.isLoadingCategorised = true;
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const AppBarWidget(title: "Details",size: 55,),
      body: SafeArea(
        child: Column(
          children: [
            Consumer<SettingsProvider>(
            builder: (_, settingsProvider, child) {
              if (settingsProvider.settingsModel != null) {
                return Stack(
                  children: [ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                  Constants.forImg +
                                      settingsProvider.settingsModel!.contest_banner,
                                  height: MediaQuery.of(context).size.width * 0.45,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                )),]
                );
              }
              return const Text(
                "Teacher Banner",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          // Consumer<SettingsProvider>(

          // ),
          // Text('widget.name'),
          
          ],
          

        ),
      )
      
      
    );
  }
}

