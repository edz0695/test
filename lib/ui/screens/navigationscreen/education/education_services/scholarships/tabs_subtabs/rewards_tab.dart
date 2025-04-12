import 'package:flutter/material.dart';

class RewardsTab extends StatelessWidget {
  const RewardsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return buildContainer(index);
        },
      ),
    );
  }

  Container buildContainer(int index) {
    return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text('Tab $index - Item $index'),
              ),
              ListTile(
                title: Text('Tab $index - Item $index'),
              ),
              ListTile(
                title: Text('Tab $index - Item $index'),
              ),
              ListTile(
                title: Text('Tab $index - Item $index'),
              ),
              ListTile(
                title: Text('Tab $index - Item $index'),
              ),
            ],
          ),
        );
  }
}
