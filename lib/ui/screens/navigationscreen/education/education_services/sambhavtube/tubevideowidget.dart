import 'package:flutter/material.dart';

class YouTubeVideo extends StatelessWidget {
  final String videoTitle;
  final String channelName;
  final String thumbnailUrl;

  const YouTubeVideo({super.key,
    required this.videoTitle,
    required this.channelName,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.network(thumbnailUrl, fit: BoxFit.cover),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('10:30', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(videoTitle, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          Row(
            children: [
              const CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/200')),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(channelName),
                    const Text('2.5M views • 1 year ago', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
