import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            final category = _categories[index];
            return _buildCategoryCard(category);
          },
        ),
      ),
    );
  }

  Widget _buildCategoryCard(Category category) {
    return GestureDetector(
      onTap: () {
        // Navigate to the apps under the selected category
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              size: 40,
              color: Colors.blue[800],
            ),
            const SizedBox(height: 10),
            Text(
              category.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              category.description,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Sample category model and data
class Category {
  final String name;
  final IconData icon;
  final String description;

  Category({required this.name, required this.icon, required this.description});
}

final List<Category> _categories = [
  Category(name: 'Games', icon: Icons.videogame_asset, description: 'Fun and Entertainment'),
  Category(name: 'Productivity', icon: Icons.work, description: 'Boost your efficiency'),
  Category(name: 'Education', icon: Icons.school, description: 'Learn new skills'),
  Category(name: 'Health & Fitness', icon: Icons.fitness_center, description: 'Stay healthy and fit'),
  // Add more categories as needed
];
