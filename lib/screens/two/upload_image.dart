import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {

  XFile? selectedImage;

  /// upload image function

  Future<void> _uploadImage () async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = pickedImage;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,


      body: Center(
        child: Column(
          children: [

            SizedBox(height: 140),

            /// container
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child:
              selectedImage == null
              ? null
              : ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(File(selectedImage!.path),fit: BoxFit.cover),
              ),
            ),

            SizedBox(height: 20),

            /// upload button
            GestureDetector(
              onTap: _uploadImage,
              child: Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Text(
                  selectedImage == null
                  ? "Upload Image"
                  : "Change Image",
                  style: TextStyle(
                  color: Colors.white,
                ),)),
              ),
            ),

            SizedBox(height: 20),

            /// remove button

            if(selectedImage != null)
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedImage = null;
                });
              },
              child: Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Text(
                  "Remove Image",
                  style: TextStyle(
                    color: Colors.red,
                  ),)),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
