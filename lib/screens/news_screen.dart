import 'package:flutter/material.dart';
import '../core/widgets/header_widget.dart';

class NewsScreen extends StatelessWidget {
  final List<Map<String, String>> newsList = [
    {
      'image': 'https://placehold.co/600x400',
      'title': 'Final Manufacturing PMI',
      'time': '18:30',
      'previous': 'PRV: 51.6',
      'forecast': 'FC: 51.6',
      'description': "'Actual' greater than 'Forecast' is good for currency",
    },
    {
      'image': 'https://placehold.co/600x400',
      'title': 'Final Manufacturing PMI',
      'time': '18:30',
      'previous': 'PRV: 51.6',
      'forecast': 'FC: 51.6',
      'description': "'Actual' greater than 'Forecast' is good for currency",
    },
    {
      'image': 'https://placehold.co/600x400',
      'title': 'Final Manufacturing PMI',
      'time': '18:30',
      'previous': 'PRV: 51.6',
      'forecast': 'FC: 51.6',
      'description': "'Actual' greater than 'Forecast' is good for currency",
    },
    {
      'image': 'https://placehold.co/600x400',
      'title': 'Final Manufacturing PMI',
      'time': '18:30',
      'previous': 'PRV: 51.6',
      'forecast': 'FC: 51.6',
      'description': "'Actual' greater than 'Forecast' is good for currency",
    },
  ];

  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const HeaderWidget(
            username: "Omar Khamis",
            profileImage: "https://placehold.co/600x400",
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: newsList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final news = newsList[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Card(
                    color: Colors.black,
                    margin: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          news['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const SizedBox(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 200,
                              color: Colors.grey[800],
                              child: const Center(
                                child: Icon(
                                  Icons.broken_image,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news['title']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(news['time']!,
                                      style: const TextStyle(
                                          color: Colors.white70)),
                                  const SizedBox(width: 10),
                                  Text(news['previous']!,
                                      style: const TextStyle(
                                          color: Colors.white70)),
                                  const SizedBox(width: 10),
                                  Text(news['forecast']!,
                                      style: const TextStyle(
                                          color: Colors.white70)),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                news['description']!,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
