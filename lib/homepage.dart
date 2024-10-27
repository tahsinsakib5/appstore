import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Apps', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBanner(context),
            const SizedBox(height: 20),
            _buildSectionTitle('Featured Apps'),
            const SizedBox(height: 16),
            _buildFeaturedAppsList(context),
            const SizedBox(height: 20),
            _buildSectionTitle('Top Categories'),
            const SizedBox(height: 16),
            _buildCategoryList(context),
            const SizedBox(height: 20),
            _buildSectionTitle('Popular Apps'),
            const SizedBox(height: 16),
            Expanded(child: _buildPopularAppsGrid(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
      
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Explore New & Trending Apps',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildFeaturedAppsList(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: _buildAppCard(context, 'Featured App $index', 'Featured'),
          );
        },
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: _buildCategoryCard(context, 'Category $index'),
          );
        },
      ),
    );
  }

  Widget _buildPopularAppsGrid(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Adjust as needed for web
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return _buildAppCard(context, 'Popular App $index', 'Popular');
      },
    );
  }

  Widget _buildAppCard(BuildContext context, String appName, String category) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/appDetail',
          arguments: {'appName': appName, 'category': category},
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: const Icon(Icons.apps, color: Colors.blue, size: 50),
            ),
            const SizedBox(height: 10),
            Text(
              appName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              category,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String categoryName) {
    return GestureDetector(
      onTap: () {
        // Implement category navigation
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 120,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Text(
            categoryName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
