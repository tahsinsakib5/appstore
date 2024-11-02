
import 'package:flutter/material.dart';

class screanshort extends StatelessWidget {
  const screanshort({
    super.key,
    required this.screenshotUrls,
  });

  final List<String> screenshotUrls;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Text(
            "App Screenshots",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount:5,
            
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/image2.jpeg",
                    width: 130,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}



// ignore: non_constant_identifier_names
