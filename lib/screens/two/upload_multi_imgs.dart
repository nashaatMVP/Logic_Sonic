import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultiImgs extends StatefulWidget {
  const UploadMultiImgs({super.key});

  @override
  State<UploadMultiImgs> createState() => _UploadMultiImgsState();
}

class _UploadMultiImgsState extends State<UploadMultiImgs> {
  List<XFile?> selectedImages = [null , null , null];

  /// upload images function
  Future<void> _uploadMultiImages () async {
    final List<XFile> pickedImages = await ImagePicker().pickMultiImage(limit: 3);

    for(int i = 0 ; i < 3 ; i++) {
      selectedImages[i] = i < pickedImages.length ? pickedImages[i] : null;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade900,

      body:  Center(
        child: Column(
          children: [
            SizedBox(height: 140),

            /// containers
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    selectedImages.length,
                    (index) {
                      final image = selectedImages[index];
                      return Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child:
                        image == null
                        ? null
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(File(image.path),fit: BoxFit.cover),
                        ),
                      );
                    },
                ),
              ),
            ),

            SizedBox(height: 50),

            /// upload images
            GestureDetector(
              onTap: _uploadMultiImages,
              child: Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Text(
                  "Upload Multi Images",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
