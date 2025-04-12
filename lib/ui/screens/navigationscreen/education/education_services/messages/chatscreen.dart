import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/education_providers/education_provider.dart';
import '../../../../../../provider/loginSignUpProvider.dart';
import '../../../../../../services/apis/apiservice.dart';
import '../../../../../dialogs/loaderdialog.dart';

class ChatScreen extends StatefulWidget {
  // const ChatScreen(Map<dynamic, String> map, {super.key});

  final String user_id;
  // final String user_type;
  const ChatScreen({super.key,required this.user_id});
  

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {

    super.initState();
    final messageProvider = Provider.of<EductionFormProvider>(context,listen: false);
    final userProvider = Provider.of<LoginSignUpProvider>(context,listen: false);
    // notesProvider.getNotes(id: widget.id,userId: userProvider.userModel!.id);
    messageProvider.getAllMessages(userId: userProvider.userModel!.id,secondId:widget.user_id);
    messageProvider.isLoadingCategorised = true;
  }

  TextEditingController inputMessage = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back,color: Colors.black,),
                ),
                const SizedBox(width: 2,),
                const CircleAvatar(
                  backgroundImage: NetworkImage("<https://randomuser.me/api/portraits/men/5.jpg>"),
                  maxRadius: 20,
                ),
                const SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Kriss Benwat",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      const SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Consumer<EductionFormProvider>(
            builder: (context, messageProvider, child) {
              return messageProvider.isLoadingCategorised?const Center(child: CircularProgressIndicator(strokeWidth: 2,),):ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 100),
                // physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: messageProvider.messages.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                    child: Align(
                      alignment: (messageProvider.messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messageProvider.messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Text(messageProvider.messages[index].message, style: const TextStyle(fontSize: 15),),
                      ),
                    ),
                  );
                },
              );
            }
          ),


          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      controller: inputMessage,
                      decoration: const InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                      final loginSignUpProvider =
                          Provider.of<LoginSignUpProvider>(context,
                              listen: false);
                              Map<String, dynamic> data = {
                                "sender_id": loginSignUpProvider.userModel!.id,
                                "reciever_id": widget.user_id,
                                "message": inputMessage.text,
                              }; 
                              showLoaderDialog(context);
                              ApiService.sendMessage(data: data).then((value) {
                                // EductionFormProvider.messages.add(1);
                                // Consumer<EductionFormProvider>(
                                //   builder: (context, messageProvider, child) {
                                //       return messageProvider.messages.add(1);
                                //   }
                                // );
                                inputMessage.clear();

                        Navigator.pop(context);
                        // Navigator.pop(context);
                      }).onError((error, stackTrace) {
                        Navigator.pop(context);
                      });
                    },
                    backgroundColor: Colors.blue,
                    elevation: 0,
                    child: const Icon(Icons.send,color: Colors.white,size: 18,),
                  ),
                ],
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}