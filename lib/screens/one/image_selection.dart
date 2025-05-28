import 'package:flutter/material.dart';

class ImageSelection extends StatefulWidget {
  const ImageSelection({super.key});

  @override
  State<ImageSelection> createState() => _ImageSelectionState();
}

class _ImageSelectionState extends State<ImageSelection> {

  List<String> photos = [
    "assets/laptop/labtop1.png",
    "assets/laptop/labtop4.png",
    "assets/laptop/labtop2.png",
    "assets/laptop/labtop3.png",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xcbfdee00),

      body: Column(
        children: [

          SizedBox(height: 100),
          /// main Container
          AnimatedContainer(
            height: 300,
            duration: Duration(milliseconds: 400),
            width: double.infinity,
            child: Image.asset(photos[selectedIndex],fit: BoxFit.cover),
          ),

          SizedBox(height: 50),

          /// other photos
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  photos.length,
                (index) {
                   return InkWell(
                     onTap: () {
                       setState(() {
                         selectedIndex = index;
                       });
                     },
                     child: AnimatedContainer(
                         duration: Duration(milliseconds: 400),
                         width: 100,
                         height: 100,
                         margin: EdgeInsets.symmetric(horizontal: 3),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(4),
                           border: Border.all(
                             color:
                             selectedIndex == index
                             ? Colors.blue
                             : Colors.white,
                           ),
                         ),
                         child: Image.asset(photos[index],fit: BoxFit.cover),
                     ),
                   );
                }
              ),
            ),
          ),


        ],
      ),

    );
  }
}
