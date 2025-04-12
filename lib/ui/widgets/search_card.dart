import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'search/search_screen.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage('assets/images/search_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fast Search',
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "You ca search quickly for\nthe job you want",
            style: TextStyle(
                height: 1.8, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SearchScreen(),),),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                        'assets/images/educationscreen/search.svg',width: MediaQuery.of(context).size.width * 0.094,height: MediaQuery.of(context).size.width * 0.095,),const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Search',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}