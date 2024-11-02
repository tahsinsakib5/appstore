import 'package:appstore/cometinputfeild.dart';
import 'package:appstore/pojectshowpage.dart';
import 'package:appstore/screanshort.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:html' as html;

import 'package:file_picker/file_picker.dart';

class AppDetailPage extends StatelessWidget {
  const AppDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('App Details'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.blueGrey[800],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProjectShowPage(),
                SizedBox(
                  height: 40,
                ),
                _buildHeaderSection(context),
                const SizedBox(height: 30),
                _buildDescriptionSection(),
                const SizedBox(height: 30),
                _buildFeatureSection(),
                
     

               CommentSection(),





                CommentInputField(
                  controller: commentController,
                  onSend: (rating, comment) {
                    setcoment(rating, comment);
                    print("Rating: $rating, Comment: $comment");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Future setcoment(int reting, String comment) async {
    Map<String, dynamic> newcoment = {
      "comment": comment,
      "rating": reting,
      "date": DateTime.now(),
      "like":0,
    };

    await FirebaseFirestore.instance
        .collection("setcomment")
        .doc("X0fO6VONEG5DXsiOcpnG").update({"allcomment":FieldValue.arrayUnion([newcoment])});;
        
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[400]!, Colors.blue[900]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Image.asset("assets/logo.jpg"),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'App Name',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Category: Productivity',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.blue[100],
                      ),
                ),
                const SizedBox(height: 12),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                    
                      downloadFile(
                          "https://github.com/tahsinsakib5/Apk/raw/refs/heads/main/nid_1.0.4.apk");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue[800],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                    ),
                    icon: const Icon(Icons.download),
                    label: const Text(
                      'Download',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'This app provides a comprehensive suite of productivity tools. With a streamlined interface, users can manage tasks, '
          'track progress, and collaborate efficiently. Aimed at maximizing efficiency and organizing workflow, it is ideal for both '
          'personal and team use.',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildFeatureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        screanshort(screenshotUrls: [
          "assets/image5.jpeg,assets/image2.jpeg,assets/image3.jpeg,assets/image4jpeg"
        ]),
        const Text(
          'Features',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        _buildFeatureItem(Icons.check_circle, 'Task Management'),
        _buildFeatureItem(Icons.check_circle, 'Time Tracking'),
        _buildFeatureItem(Icons.check_circle, 'Collaboration Tools'),
        _buildFeatureItem(Icons.check_circle, 'Customizable Interface'),
        _buildFeatureItem(Icons.check_circle, 'Cross-Platform Compatibility'),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue[700], size: 24),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }



  void downloadFile(String url) {
    html.AnchorElement anchorElement = new html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }


}



List<Comment> comments = [
  Comment(
    profilePictureUrl: 'https://example.com/user1.jpg',
    userName: 'Alice Johnson',
    rating: 4.7,
    date: 'Oct 20, 2024',
    text: 'This app exceeded my expectations! Smooth and user-friendly.',
    likes: 28,
  ),
  Comment(
    profilePictureUrl: 'https://example.com/user1.jpg',
    userName: 'Alice Johnson',
    rating: 4.7,
    date: 'Oct 20, 2024',
    text: 'This app exceeded my expectations! Smooth and user-friendly.',
    likes: 28,
  ),
];

class CommentSection extends StatelessWidget {
  const CommentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'User Reviews',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 15),

        // StreamBuilder to fetch comments from Firestore
        StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("setcomment")
              .doc("X0fO6VONEG5DXsiOcpnG")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show loading indicator while waiting for data
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Text("No comments available"); // Message if no data found
            }

            // Retrieve the comments field as a list of dynamic items
            List<dynamic> comments = snapshot.data!["allcomment"] as List?? [];

            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return CommentWidget(comment: comments[index],index:index,);
              },
            );
          },
        ),
      ],
    );
  }
}


class CommentWidget extends StatefulWidget {
  final int index;
  final Map<String,dynamic> comment;

  const CommentWidget({Key? key, required this.comment, required this.index}) : super(key: key);

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}
 bool likevalue = false;
class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime commentDate = (widget.comment['date'] as Timestamp).toDate();
    String formattedDate = DateFormat('MMM dd, yyyy').format(commentDate);
   
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.amber,
                backgroundImage: AssetImage("assets/anonimus.jpg"),
                radius: 25,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Anonymous",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5),
                 Row(
  children: [
    // Generate stars based on the rating value
    Row(
      children: List.generate(
        widget.comment["rating"],
        (index) => Icon(Icons.star, color: Colors.orange, size: 18),
      ),
    ),
    SizedBox(width: 5),
    Text(
      widget.comment["rating"].toString(),
      style: TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    ),
    SizedBox(width: 10),
    Text(
      formattedDate,
      style: TextStyle(color: Colors.grey),
    ),
  ],
),

                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            widget.comment["comment"],
            style: TextStyle(
              fontSize: 15,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
          SizedBox(height: 12),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.thumb_up_alt_outlined, color: likevalue==false? Colors.grey:Colors.blue
                     ),
                    onPressed: () {
                  

                      incrementLike(widget.comment["like"],widget.index);
                    },
                  ),
                  Text(widget.comment["like"].toString(),
                      style: TextStyle(color: Colors.black54)),
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_vert, color: Colors.grey),
                onPressed: () {
                 
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void incrementLike(int like,int index) async {
  if(likevalue==false){
setState(() {
    
  });
  }else{
 like -= 1;
  }

  likevalue=!likevalue;
  
  
  // Update the 'likes' field in Firestore for this comment
  await FirebaseFirestore.instance
      .collection("setcoment")
      .doc("X0fO6VONEG5DXsiOcpnG") // Replace with actual document ID
      .update({
    'allcomment':[index][like], // Update the likes count
  });
}
}

class Comment {
  final String profilePictureUrl;
  final String userName;
  final double rating;
  final String date;
  final String text;
  final int likes;

  Comment({
    required this.profilePictureUrl,
    required this.userName,
    required this.rating,
    required this.date,
    required this.text,
    required this.likes,
  });
}





  

