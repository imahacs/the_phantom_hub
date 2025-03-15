import 'package:flutter/material.dart';
import '../core/widgets/header_widget.dart';

class SignalsScreen extends StatelessWidget {
  const SignalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const HeaderWidget(
            username: 'Omar Khamis',
            profileImage: 'https://placehold.co/600x400',
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildSignalCard(
                    isActive: true,
                    id: '2304',
                    duration: 'Semi-Swing',
                    pair: 'BTC/USD',
                    action: 'Buy',
                    entryPrice: '95,600 - 95,400',
                    currentPrice: '95,548.48',
                    stopLoss: '95,000',
                    takeProfits: ['95,800', '96,000', '96,200'],
                    riskLevel: 3,
                  ),
                  const SizedBox(height: 20),
                  _buildSignalCard(
                    isActive: false,
                    id: '2303',
                    duration: 'Short',
                    pair: 'XAU/USD',
                    action: 'Sell',
                    entryPrice: '2,606 - 2,608',
                    currentPrice: '2,585.23',
                    stopLoss: '2,610',
                    takeProfits: ['2,604', '2,602', '2,600'],
                    riskLevel: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignalCard({
    required bool isActive,
    required String id,
    required String duration,
    required String pair,
    required String action,
    required String entryPrice,
    required String currentPrice,
    required String stopLoss,
    required List<String> takeProfits,
    required int riskLevel,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    isActive ? Icons.check_circle : Icons.shield,
                    color: isActive ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isActive ? 'Active' : 'Inactive',
                    style: TextStyle(
                      color: isActive ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                'ID: $id',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Duration: $duration',
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                pair,
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: action == 'Buy' ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  action,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildSignalDetail('Entry Price', entryPrice),
          _buildSignalDetail('Current Price', currentPrice),
          _buildSignalDetail('Stop Loss', stopLoss),
          const SizedBox(height: 8),
          Text('Take Profits:', style: const TextStyle(color: Colors.white)),
          for (var tp in takeProfits) _buildTakeProfit(tp),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text('Risk:', style: TextStyle(color: Colors.white)),
              const SizedBox(width: 8),
              for (int i = 0; i < riskLevel; i++)
                const Icon(Icons.bar_chart, color: Colors.green, size: 18),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSignalDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildTakeProfit(String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          const Icon(Icons.check, color: Colors.green, size: 18),
          const SizedBox(width: 8),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
