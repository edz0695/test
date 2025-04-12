import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/services/apis/apiservice.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/online_tutor/tutorbatches.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../../../../provider/loginSignUpProvider.dart';
import '../../../../../../dialogs/loaderdialog.dart';
import '../../../../../../widgets/profile_widget.dart';


class TeacherProfile extends StatefulWidget {
  final String id;
  const TeacherProfile({super.key,required this.id});

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  static String basicAuth =
      'Basic ${base64.encode(utf8.encode('mygromoapp:SacPass112233'))}';

  Future<Map> fetchAllLeads(BuildContext context) async {
    final pro  = Provider.of<LoginSignUpProvider>(context,listen: false);
    var url = Uri.parse("https://sambhavapps.com/admin/api/teacherprofile/${widget.id}");
    final http.Response response =
    await http.get(url, headers: {"authorization": basicAuth});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      // final data = responseData['profile'] as List;
      printThis(widget.id);
      return  responseData['profile'];
    } else {
      return{};
    }
  }
  late var _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    printThis("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    printThis("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    printThis("Payment Fail");
  }

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(title: "Profile",size: 55,),

      body:  FutureBuilder<Map>(
          future: fetchAllLeads(context),
          builder: (_, snapshot) {
            
            if(snapshot.hasData){
              List<dynamic> dynamicList = snapshot.data!['available_slots'];
              List<dynamic> languageList = snapshot.data!['language'];
              List<Widget> widgetList2 = languageList
    .map((item) => FilterChip(
                            showCheckmark: false,
                            label: Text(
                              item.toString(),
                              style: const TextStyle(
                                  color: Colors.black),
                            ),
                            backgroundColor: Colors.grey.shade200,
                            selectedColor: Colors.grey.shade600,
                            selected: false,
                            onSelected: (bool value) {}))
    .toList();

List<Widget> widgetList = dynamicList
    .map((item) => FilterChip(
                            showCheckmark: false,
                            label: Text(
                              item.toString(),
                              style: const TextStyle(
                                  color: Colors.black),
                            ),
                            backgroundColor: Colors.grey.shade200,
                            selectedColor: Colors.grey.shade600,
                            selected: false,
                            onSelected: (bool value) {}))
    .toList();
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      child: Column(
                        children: [
                          ProfileWidget(
                            imagePath: "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80  ",
                            onClicked: () async {},
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Text(
                                snapshot.data!['name']??"",
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                snapshot.data!['email']??"",
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'About',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  snapshot.data!['bio']??"" ,
                                  style: const TextStyle(fontSize: 16, height: 1.4),
                                ),


                                const Divider(
                                    color: Colors.black
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Teaching Subjects',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  snapshot.data!['subjects']??"" ,
                                  style: const TextStyle(fontSize: 16, height: 1.4),
                                ),
                                const Divider(
                                    color: Colors.black
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Available Slots',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                PreferredSize(
                                  preferredSize: const Size.fromHeight(40.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    child: Row(
                                      children: [                
                                        Wrap(
                                            spacing: 5,
                                            children: widgetList,
                                            )
                                      ],
                                    ),
                                  )
                                ),
                                const Divider(
                                    color: Colors.black
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Class Duration',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  snapshot.data!['class_duration']??"" ,
                                  style: const TextStyle(fontSize: 16, height: 1.4),
                                ),
                                const Divider(
                                    color: Colors.black
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Fees',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  snapshot.data!['fee']??"" ,
                                  style: const TextStyle(fontSize: 16, height: 1.4),
                                ),
                                const Divider(
                                    color: Colors.black
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Language',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                PreferredSize(
                                  preferredSize: const Size.fromHeight(40.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    child: Row(
                                      children: [                
                                        Wrap(
                                            spacing: 5,
                                            children: widgetList2,
                                            )
                                      ],
                                    ),
                                  )
                                ),
                                const Divider(
                                    color: Colors.black
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Experience',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  snapshot.data!['experience']??"" ,
                                  style: const TextStyle(fontSize: 16, height: 1.4),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                                    color: Colors.black
                                ),
                                  Container(
  width: double.infinity,
  padding: const EdgeInsets.symmetric(horizontal: 5.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    textBaseline: TextBaseline.alphabetic,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: ElevatedButton(
              onPressed: () {
                // Implement hire now button functionality
              },
              child: const Text('Hire Now'),
            ),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: SizedBox(
              height: 30.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> TutorBatches(id: snapshot.data!['user_id'],)));
                },
                child: const Text('See Courses', style: TextStyle(fontSize: 12.0)),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: ElevatedButton(
              onPressed: () {
                showLoaderDialog(context);
                    final loginSignUpProvider =
                        Provider.of<LoginSignUpProvider>(context,
                            listen: false);
                    Map<String, dynamic> data = {
                      "type":"cart",
                      "obj_type":"teacher",
                      "user_id": loginSignUpProvider.userModel!.id,
                      "obj_id": snapshot.data!['user_id'],
                    };
                    ApiService.submitToCart(data: data)
                        .then((value) {
                      Navigator.pop(context);
                      // Navigator.pop(context);
                    })
                        .onError((error, stackTrace) {
                      Navigator.pop(context);
                    });
                  
                // Implement add to cart button functionality
              },
              child: const Text('Add to Cart'),
            ),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: SizedBox(
              height: 30.0,
              child: ElevatedButton(
                onPressed: () {
                  showLoaderDialog(context);
                    final loginSignUpProvider =
                        Provider.of<LoginSignUpProvider>(context,
                            listen: false);
                    Map<String, dynamic> data = {
                      "type":"wishlist",
                      "obj_type":"teacher",
                      "user_id": loginSignUpProvider.userModel!.id,
                      "obj_id": snapshot.data!['user_id'],
                    };
                    ApiService.submitToCart(data: data)
                        .then((value) {
                      Navigator.pop(context);
                      // Navigator.pop(context);
                    })
                        .onError((error, stackTrace) {
                      Navigator.pop(context);
                    });
                  // Implement add to wishlist button functionality
                },
                child: const Text('Add to Wishlist', style: TextStyle(fontSize: 12.0)),
              ),
            ),
          ),
        ),
      ),
    ],
  ),
)




                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return const Center(child: CircularProgressIndicator(),);
          })
    );
  }
  Widget buildDivider() => const SizedBox(
          height: 24,
          child: VerticalDivider(),
        );
  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
