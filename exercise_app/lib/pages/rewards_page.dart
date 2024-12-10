// lib/pages/rewards_page.dart
import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  void _showGetPointsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Get More Points',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Watch Ad Option
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.ondemand_video, color: Colors.white),
                    title: const Text(
                      'Watch an Ad',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Earn 50 points',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      // Implement ad watching functionality
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                
                // Points Packs
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.stars, color: Colors.amber),
                    title: const Text(
                      '1,000 Points',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      '\$0.99',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      // Implement purchase functionality
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.stars, color: Colors.amber),
                    title: const Text(
                      '5,000 Points',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      '\$4.99 (Save 20%)',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      // Implement purchase functionality
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.stars, color: Colors.amber),
                    title: const Text(
                      '10,000 Points',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      '\$8.99 (Save 35%)',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      // Implement purchase functionality
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 24),
                
                // Close Button
                TextButton(
                  child: const Text('Close'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Rewards',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Points: 1265',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Available Rewards
              _buildRewardItem('Habit Gear', '1,000', true),
              _buildRewardItem('Power-ups', '5,000', false),
              _buildRewardItem('Habit Boosts', '10,000', false),
              
              const SizedBox(height: 32),
              const Text(
                'Your Progress',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              
              // Progress Items
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildProgressItem('Habit Gear', '0/2'),
                      _buildProgressItem('Good Sleep Gear', '', progressValue: 0.4),
                      _buildProgressItem('Power-ups', '1/3'),
                      _buildProgressItem('Power-up: Extra Life', '', progressValue: 0.6),
                      _buildProgressItem('Habit Boosts', '0/4'),
                      _buildProgressItem('Boost: Double Down', '', progressValue: 0.8),
                    ],
                  ),
                ),
              ),
              
              // Get More Points Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _showGetPointsDialog(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Get More Points'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRewardItem(String name, String points, bool canBuy) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                '$points points',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: canBuy ? () {} : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[800],
              disabledBackgroundColor: Colors.grey[900],
            ),
            child: Text(canBuy ? 'Buy!' : "Can't Buy"),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressItem(String name, String count, {double? progressValue}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(color: Colors.white),
              ),
              if (count.isNotEmpty)
                Text(
                  count,
                  style: const TextStyle(color: Colors.white),
                ),
            ],
          ),
          if (progressValue != null) ...[
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progressValue,
              backgroundColor: Colors.grey[800],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ],
        ],
      ),
    );
  }
}