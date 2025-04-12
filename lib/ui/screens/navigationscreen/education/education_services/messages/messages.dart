import 'package:flutter/material.dart';
import 'package:payapp/ui/screens/navigationscreen/education/education_services/messages/chatscreen.dart';
import 'package:payapp/ui/widgets/message/messagetile.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/education_providers/education_provider.dart';
import '../../../../../../provider/loginSignUpProvider.dart';
import '../../../../../widgets/app_bar_widget.dart';

class MyMessages extends StatefulWidget {
  const MyMessages({super.key});

  @override
  State<MyMessages> createState() => _MyMessagesState();
}

class _MyMessagesState extends State<MyMessages> {
  @override
  void initState() {

    super.initState();
    final messageProvider = Provider.of<EductionFormProvider>(context,listen: false);

    final userProvider = Provider.of<LoginSignUpProvider>(context,listen: false);
    messageProvider.getMessages(userId: userProvider.userModel!.id);
    messageProvider.isLoadingCategorised = true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "My Chats",size: 55,),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Consumer<EductionFormProvider>(
                  builder: (context, messageProvider, child) {
                    return messageProvider.isLoadingCategorised?const Center(child: CircularProgressIndicator(strokeWidth: 2,),):ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),

                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 100),
                      // physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      itemCount: messageProvider.messagesList.length,
                      itemBuilder: (context, index) {
                        return MessageTile(mainmessage: messageProvider.messagesList[index],onTap: (){
                          final loginSignUpProvider = Provider.of<LoginSignUpProvider>(context,
                              listen: false);
                          Navigator.push(
                              context,
                              MaterialPageRoute( 
                                  builder: (context) =>
                                      ChatScreen(user_id: messageProvider.messagesList[index].reciever_id == loginSignUpProvider.userModel!.id?messageProvider.messagesList[index].sender_id:messageProvider.messagesList[index].reciever_id)));
                        });
                      },
                    );
                  }
                ),



            // Expanded(
            //   child: 
              // Row(
              //   children: [
              //     CircleAvatar(
              //       backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/149/149071.png'),
              //       maxRadius: 30,
              //     ),
              //     SizedBox(width: 16,),
              //     Expanded(
              //       child: Container(
              //         color: Colors.transparent,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Text('sachin', style: TextStyle(fontSize: 16),),
              //             SizedBox(height: 6,),
              //             Text('Hi How are you?',style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: FontWeight.bold),),
              //           ],
              //         ),
              //       ),
              //     ),
                  
              //   ],
              // ),
            // ),
          ]
        )
      )
    );
  }
}