import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'dart:html' as html;

import 'package:firebase_storage/firebase_storage.dart';

import 'package:file_picker/file_picker.dart';


import 'package:file_saver/file_saver.dart';
class AppDetailPage extends StatelessWidget {
  const AppDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                _buildHeaderSection(context),
                const SizedBox(height: 30),
                _buildDescriptionSection(),
                const SizedBox(height: 30),
                _buildFeatureSection(),
              ],
            ),
          ),
        ),
      ),
    );
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
            child: const Icon(Icons.apps, color: Colors.blue, size: 50),
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
                    onPressed: ()async{

                        // const String url = 'https://drive.google.com/uc?id=1SoYZGrbJ0lUHNn3tvySf_YkeQqsSrG38&export=download'; // Replace with your APK URL
                        // if (await canLaunch(url)) {
                        //   await launch(url);
                        //   // Show instructions after launching the URL
                          
                        // } else {
                        //   throw 'Could not launch $url';
                        // }

                        
                            
                           

                  downloadFile("https://firebasestorage.googleapis.com/v0/b/appstore-74aea.appspot.com/o/WhatsApp%20Audio%202024-10-22%20at%203.28.56%20AM.wav?alt=media&token=f17686ae-f2f1-4e8b-b7e0-36d99ffa6eee");

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
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                ElevatedButton(onPressed: () {
                  pickFile();
                }, child:Text("fff"))
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

  //  Future<void> downloadAPK() async {
  //   const String url = 'https://yourdomain.com/yourfile.apk'; // Replace with your APK URL
  //   try {
  //     // Get the application documents directory
  //     Directory appDocDir = await getApplicationDocumentsDirectory();
  //     String savePath = '${appDocDir.path}/yourfile.apk'; // Path where the file will be saved

  //     // Create a Dio instance
  //     Dio dio = Dio();
  //     await dio.download(url, savePath, onReceiveProgress: (received, total) {
  //       if (total != -1) {
  //         print((received / total * 100).toStringAsFixed(0) + '%');
  //       }
  //     });

  //     print('File downloaded to: $savePath');
  //     // Optionally, you can open the file or notify the user

  //   } catch (e) {
  //     print('Download failed: $e');
  //   }
  // }

//  void downloadAPK() {
//     const String url = 'https://drive.google.com/uc?export=download&id=1SoYZGrbJ0lUHNn3tvySf_YkeQqsSrG38'; // Direct download URL

//     // Create an anchor element for download
//     final anchor = html.AnchorElement(href: url)
//       ..setAttribute('download', 'your_apk_file.apk') // Specify the name for the downloaded file
//       ..setAttribute('target', '_self') // Ensure it opens in the same tab
//       ..click(); // Programmatically click the anchor to trigger the download
//  }

// Example function to start a download


void downloadFile(String url) {
   html.AnchorElement anchorElement =  new html.AnchorElement(href: url);
   anchorElement.download = url;
   anchorElement.click();
}


// Future<void> downloadAndSaveFile() async {
//   final ref = FirebaseStorage.instance.ref().child("path/to/your/file.apk");
//   Uint8List? fileData = await ref.getData();

//   if (fileData != null) {
//     await FileSaver.instance.saveFile(
//       "downloaded_file",
//       fileData,
//       "apk",
//       mimeType: MimeType.,
//     );
//     print("File downloaded and saved.");
//   } else {
//     print("Failed to retrieve file data from Firebase.");
//   }
}


Future<void> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['apk'],
  );

  if (result != null) {
    print("File picked: ${result.files.single.name}");
  } else {
    print("No file selected");
  }
}




