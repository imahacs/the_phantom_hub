import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../core/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(
              username: 'Omar Khamis',
              profileImage: 'https://placehold.co/600x400',
            ),
            const SizedBox(height: 20),

            // Market Data Section
            _buildMarketItem(
              imagePath: "./assets/icons/1.svg",
              name: "XAUUSD",
              description: "Gold Spot / U.S. Dollar",
              price: "2,894.975",
              change: "-1.92%",
            ),
            _buildMarketItem(
              imagePath: "./assets/icons/2.svg",
              name: "BTCUSD",
              description: "Bitcoin / U.S. Dollar",
              price: "87,348.05",
              change: "-4.70%",
            ),
            _buildMarketItem(
              imagePath: "assets/icons/3.svg",
              name: "Nasdaq",
              description: "US 100 Cash CFD",
              price: "21,049.70",
              change: "-1.42%",
            ),
            _buildMarketItem(
              imagePath: "assets/icons/4.svg",
              name: "US30",
              description: "Dow Jones Industrial Average Index",
              price: "43,415.68",
              change: "-0.20%",
            ),
            const SizedBox(height: 20),

            // Quick Actions
            const Text(
              "Quick Action",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildQuickAction("Trading Signals", LucideIcons.signal),
                _buildQuickAction("Live", LucideIcons.playCircle),
                _buildQuickAction("News", LucideIcons.newspaper),
                _buildQuickAction("Courses", LucideIcons.bookOpen),
                _buildQuickAction("Calculator", LucideIcons.calculator),
                _buildQuickAction("Channel", LucideIcons.users),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketItem({
    required String imagePath,
    required String name,
    required String description,
    required String price,
    required String change,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            imagePath,
            width: 72, // Increased width
            height: 72, // Increased height
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "$price USD",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                change,
                style: TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(String title, IconData icon) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
