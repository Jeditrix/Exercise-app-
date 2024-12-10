// lib/pages/achievements_page.dart
import 'package:flutter/material.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Achievements'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Overview
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatCard('12', 'Total\nAchievements'),
                  _buildStatCard('8', 'Badges\nEarned'),
                  _buildStatCard('4', 'In\nProgress'),
                ],
              ),
            ),

            // Earned Achievements
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Earned',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildAchievement(
              'assets/trophy.jpeg',
              '100 Workouts',
              'Complete 100 workouts',
              '5 badges earned',
              true,
            ),
            _buildAchievement(
              'assets/flame.jpeg',
              '10K Calories Burned',
              'Burn 10,000 calories total',
              '3 badges earned',
              true,
            ),
            _buildAchievement(
              'assets/streak.png',
              'Consistency Is Key',
              'Complete a workout every day for 7 days',
              '2 badges earned',
              true,
            ),

            // In Progress Achievements
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'In Progress',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildAchievement(
              'assets/medal.jpeg',
              'Power User',
              'Complete 500 workouts',
              '352/500 completed',
              false,
              progressValue: 0.7,
            ),
            _buildAchievement(
              'assets/weightlifting.jpeg',
              'Strength Master',
              'Complete 50 strength workouts',
              '38/50 completed',
              false,
              progressValue: 0.76,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievement(
    String imagePath,
    String title,
    String description,
    String progress,
    bool isEarned, {
    double? progressValue,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Content section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isEarned)
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[400]),
                ),
                const SizedBox(height: 8),
                if (progressValue != null) ...[
                  LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: Colors.grey[800],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                  const SizedBox(height: 8),
                ],
                Text(
                  progress,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}