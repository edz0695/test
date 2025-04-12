import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:payapp/models/messageModel.dart';

import '../../screens/navigationscreen/education/education_services/messages/chatscreen.dart';

class MessageTile extends StatelessWidget {
  // final SubjectModel subject;
  final MessaeModel mainmessage;
  final Function()? onTap;

  const MessageTile({super.key, required this.mainmessage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ChatScreen(user_id: '8')));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  const CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                    maxRadius: 30,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            mainmessage.reciever_name,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            mainmessage.message,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              Jiffy.parse(mainmessage.created_at).fromNow(),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
