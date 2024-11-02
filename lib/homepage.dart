import 'package:appstore/pojectshowpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Apps', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
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
      body: Center(
        child: ConstrainedBox(
        
          constraints: BoxConstraints(maxWidth:1300,),
        
          child: SingleChildScrollView(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                  height: 40,
                ),
                ProjectShowPage(),
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
                _buildPopularAppsGrid(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget _buildBanner(BuildContext context) {
  return Container(
    height: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
      image: const DecorationImage(
        image: NetworkImage('assets/image1.jpeg'), // Replace with your image URL
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Text(
        'Explore New & Trending Apps',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black45,
                  offset: Offset(1, 1),
                  blurRadius: 4,
                ),
              ],
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
    height: 250,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: _buildAppCard(context, 'Featured App $index', 'Productivity'),
        );
      },
    ),
  );
}

Widget _buildAppCard(BuildContext context, String appName, String category) {
  return Container(
    width: 160,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // App Icon Placeholder
        Container(
          height: 100,
          width: 100,
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: NetworkImage('assets/logo.jpg'), // Replace with your app icon URL
              fit: BoxFit.cover,
            ),
          ),
        ),


        const SizedBox(height: 12),
        
        // App Name
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            appName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        
        // Category
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Text(
            category,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ),
        
        // Action Button
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: ElevatedButton(
            onPressed: () {
               Navigator.pushNamed(
          context,
          '/appDetail',
          arguments: {'appName': appName, 'category': category},
        );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            child: const Text(
              'Install',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
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
       
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return _buildAppCard(context, 'Popular App $index', 'Popular');
      },
    );
  }

  






Widget _buildCategoryCard(BuildContext context, String categoryName) {
  return GestureDetector(
    onTap: () {
      // Implement category navigation
    },
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 400,
        width: 140,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Category Icon Placeholder with gradient
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF42A5F5), Color(0xFF1976D2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.category, // Example icon; adjust or replace as needed
                color: Colors.white,
                size: 28, // Reduced size for a cleaner look
              ),
            ),
            const SizedBox(height: 12),
            
            // Category Name
            Text(
              categoryName,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
}