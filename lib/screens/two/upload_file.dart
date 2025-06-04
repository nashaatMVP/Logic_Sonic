import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  String? _fileName;
  String? _filePath;

  /// pickFile method
  Future<void> _pickFile () async {

    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf' , 'docx' , 'doc' , 'jpg'],
    );

    if(file != null && file.files.single.name.isNotEmpty) {
      setState(() {
        _fileName = file.files.single.name;
        _filePath = file.files.single.path;
      });
    }

  }

  /// view file
  // void _openFile (String? path) {
  //   OpenFile.open(path);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 130),
            Container(
              width: 350,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.black12),

              ),

              child: Row(
                children: [
                  SvgPicture.asset(
                      width: 60,
                      "assets/svgs/doc.svg",
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _fileName == null
                        ? "Upload File"
                        : "$_fileName",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("pdf, docx, doc, jpg"),
                    ],
                  ),
                  Spacer(),


                  PopupMenuButton(
                      color: Colors.white,
                      itemBuilder: (context) {
                        return [

                          /// upload
                          PopupMenuItem(
                              onTap: _pickFile,
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.arrow_up_doc),
                                  SizedBox(width: 13),
                                  Text("Upload"),
                                ],
                              ),
                          ),

                          /// View
                          PopupMenuItem(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.eye),
                                  SizedBox(width: 13),
                                  Text("View"),
                                ],
                              ),
                          ),

                          /// change
                          PopupMenuItem(
                              onTap: _pickFile,
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.refresh),
                                  SizedBox(width: 13),
                                  Text("Change"),
                                ],
                              ),
                          ),


                          /// delete
                          PopupMenuItem(
                              onTap: () {
                                setState(() {
                                  _fileName = null;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.delete_solid, color: Colors.red),
                                  SizedBox(width: 13),
                                  Text("Delete",style: TextStyle(
                                    color: Colors.red,
                                  )),
                                ],
                              ),
                          ),

                        ];
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            if(_filePath != null && _filePath!.endsWith('pdf'))
            SizedBox(
              width: 230,
              height: 400,
              child: SfPdfViewer.file(
                File(
                  _filePath!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
