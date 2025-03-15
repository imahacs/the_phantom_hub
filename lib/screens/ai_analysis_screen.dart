import 'package:flutter/material.dart';
import '../core/widgets/header_widget.dart';

class AIAnalysisScreen extends StatelessWidget {
  const AIAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(
            username: 'Omar Khamis',
            profileImage: 'https://placehold.co/600x400',
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'AI Analysis Screen',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
