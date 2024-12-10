// lib/pages/friends_page.dart
import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

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
              const Text(
                'My Friends',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Find Friends',
                    hintStyle: TextStyle(color: Colors.grey),
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Friends List
              Expanded(
                child: ListView(
                  children: [
                    _buildFriendItem('Adam Henry'),
                    _buildFriendItem('Erin Taylor'),
                    _buildFriendItem('Ivy Nolan'),
                    _buildFriendItem('Kendrick Moreno'),
                    _buildFriendItem('Olivia Smith'),
                    const SizedBox(height: 32),
                    const Text(
                      'Rankings of Other Gym Goers',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildRankingItem('Miles', '23,131'),
                    _buildRankingItem('Jillian', '19,999'),
                    _buildRankingItem('Carter', '17,900'),
                    _buildRankingItem('Zach', '14,800'),
                    _buildRankingItem('Liam', '12,600'),
                    _buildRankingItem('Ethan', '11,500'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFriendItem(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[800],
            child: Text(name[0], style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 16),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRankingItem(String name, String score) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            score,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}