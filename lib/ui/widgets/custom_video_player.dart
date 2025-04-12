import 'package:flutter/material.dart';

class MyCustomVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const MyCustomVideoPlayer({super.key, required this.videoUrl});

  @override
  State<MyCustomVideoPlayer> createState() => _MyCustomVideoPlayerState();
}

class _MyCustomVideoPlayerState extends State<MyCustomVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn all about BankSathi"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              height: 250,
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    height: 80,
                    child: Column(
                      children: [
                        Text("Learn all about BankSathi",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text("00:03 / 01:06"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              height: 100,
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [SizedBox(width: 120, child: Placeholder())],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
