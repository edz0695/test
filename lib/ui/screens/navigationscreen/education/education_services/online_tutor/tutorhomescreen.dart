import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/ui/screens/navigationscreen/education/HometuterTiles.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/online_tutor/hiredhometutors.dart';

import '../../../../../widgets/app_bar_widget.dart';

class TutorHomeScreen extends StatefulWidget {
  const TutorHomeScreen({super.key});

  @override
  State<TutorHomeScreen> createState() => _TutorHomeScreenState();
}

class _TutorHomeScreenState extends State<TutorHomeScreen>
    with AutomaticKeepAliveClientMixin<TutorHomeScreen> {
  @override
  void initState() {
    printThis('TutorHomeScreen opend');
    super.initState();
    // final educationProvider =
    //     Provider.of<EductionFormProvider>(context, listen: false);
    // educationProvider.getClasses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          title: "Tutor",
          size: 55,
        ),
        body: GridView(
          // itemCount: educationProvider.classes.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (1 / 1.3),
              crossAxisSpacing: 15,
              mainAxisSpacing: 10),
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HiredhomeTutors()));
              },
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: SvgPicture.asset(
                      'assets/images/educationscreen/teacher-icon.svg',
                      width: MediaQuery.of(context).size.width * 0.094,
                      height: MediaQuery.of(context).size.width * 0.095,
                    )),
                    Text(
                      'Hired teachers',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Hometuter()));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: SvgPicture.asset(
                      'assets/images/educationscreen/hometutor.svg',
                      width: MediaQuery.of(context).size.width * 0.094,
                      height: MediaQuery.of(context).size.width * 0.095,
                    )),
                    Text(
                      'Teachers near me',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> sambhavtube()));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: SvgPicture.asset(
                      'assets/images/educationscreen/message-svgrepo-com.svg',
                      width: MediaQuery.of(context).size.width * 0.094,
                      height: MediaQuery.of(context).size.width * 0.095,
                    )),
                    Text(
                      'Messages',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
