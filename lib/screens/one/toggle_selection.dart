import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSelection extends StatefulWidget {
  const ToggleSelection({super.key});

  @override
  State<ToggleSelection> createState() => _ToggleSelectionState();
}

class _ToggleSelectionState extends State<ToggleSelection> {
  bool isFollow = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 140),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage("assets/sonic.png"),
                ),

                Positioned(
                  bottom: -20,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFollow =! isFollow;
                      });
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.pink,
                      child: Icon(
                          isFollow
                          ? CupertinoIcons.check_mark
                          : CupertinoIcons.add,
                          color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 100),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                      isFollow
                          ? CupertinoIcons.check_mark
                          : CupertinoIcons.add,
                      color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                      "Rich Sonic",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),

    );
  }
}
