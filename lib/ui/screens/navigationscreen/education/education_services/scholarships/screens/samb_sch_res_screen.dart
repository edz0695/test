import 'package:flutter/material.dart';
import 'package:payapp/themes/colors.dart';
import 'package:payapp/ui/widgets/app_bar_widget.dart';

class ResultModel {
  final String rank;
  final String image;
  final String name;
  final String score;

  ResultModel(this.rank, this.image, this.name, this.score);
}

List<ResultModel> results = [
  ResultModel(
    '1',
    'https://th.bing.com/th/id/R.61e53186539cfd0baad39ac4b4991819?rik=I7BAkX%2bcPsM2PQ&pid=ImgRaw&r=0',
    'Osama ',
    '445',
  ),
  ResultModel(
    '2',
    'https://images.pexels.com/photos/13940670/pexels-photo-13940670.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load',
    'Mohammed ',
    '445',
  ),
  ResultModel(
    '3',
    'https://th.bing.com/th/id/R.61e53186539cfd0baad39ac4b4991819?rik=I7BAkX%2bcPsM2PQ&pid=ImgRaw&r=0',
    'Umika',
    '445',
  ),
  ResultModel(
    '4',
    'https://images.pexels.com/photos/33961/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1600&lazy=load',
    'Osama ',
    '445',
  ),
  ResultModel(
    '5',
    'https://th.bing.com/th/id/R.61e53186539cfd0baad39ac4b4991819?rik=I7BAkX%2bcPsM2PQ&pid=ImgRaw&r=0',
    'Osama ',
    '445',
  ),
  ResultModel(
    '1',
    'https://th.bing.com/th/id/R.61e53186539cfd0baad39ac4b4991819?rik=I7BAkX%2bcPsM2PQ&pid=ImgRaw&r=0',
    'Osama ',
    '445',
  ),
  ResultModel(
    '2',
    'https://images.pexels.com/photos/13940670/pexels-photo-13940670.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load',
    'Mohammed ',
    '445',
  ),
  ResultModel(
    '3',
    'https://th.bing.com/th/id/R.61e53186539cfd0baad39ac4b4991819?rik=I7BAkX%2bcPsM2PQ&pid=ImgRaw&r=0',
    'Umika',
    '445',
  ),
  ResultModel(
    '4',
    'https://images.pexels.com/photos/33961/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1600&lazy=load',
    'Osama ',
    '445',
  ),
  ResultModel(
    '5',
    'https://th.bing.com/th/id/R.61e53186539cfd0baad39ac4b4991819?rik=I7BAkX%2bcPsM2PQ&pid=ImgRaw&r=0',
    'Osama ',
    '445',
  ),
];

class SambhavScholarshipsResultsScreen extends StatelessWidget {
  const SambhavScholarshipsResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      appBar: const AppBarWidget(title: 'Results', size: 55),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/education/top_3.jpg',
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: width*0.22,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.purpleAccent,
                  backgroundImage: NetworkImage(results[2].image),
                ),
                Text(
                  results[2].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left:  width*0.405,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.pink,
                  backgroundImage: NetworkImage(results[1].image),
                ),
                Text(
                  results[1].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 120,
            right:  width*0.22,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.orange,
                  backgroundImage: NetworkImage(results[3].image),
                ),
                Text(
                  results[3].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 300,
                ),
                Expanded(
                  child: SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, right: 5, left: 2),
                        itemCount: results.length,
                        itemBuilder: (context, index) =>
                            buildResultItem(results[index]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildResultItem(ResultModel model) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 0),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: ThemeColors.darkBlueColor,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                model.image,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              model.name * 5,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: ThemeColors.darkBlueColor,
                child: Text(
                  model.rank,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    model.score,
                    style: const TextStyle(
                      fontSize: 16,
                      color: ThemeColors.darkBlueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.sports_handball,
                    color: ThemeColors.darkBlueColor,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
