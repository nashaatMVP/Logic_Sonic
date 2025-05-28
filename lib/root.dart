import 'package:flutter/material.dart';
import 'package:logic_sonic/screens/one/image_selection.dart';
import 'package:logic_sonic/screens/one/multi_selection.dart';
import 'package:logic_sonic/screens/one/single_selection.dart';
import 'package:logic_sonic/screens/one/toggle_selection.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int selectedIndex = 0;
  List<Widget> screens = [
    SingleSelection(),
    ImageSelection(),
    ToggleSelection(),
    MultiSelection(),
  ];
  final PageController controller = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
        onPageChanged: (v) {
          setState(() {
            selectedIndex = v;
          });
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                /// back
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.jumpToPage(selectedIndex - 1);
                    });
                  },
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Icon(Icons.arrow_back_outlined,color: Colors.black),
                  ),
                ),
                SizedBox(width: 10),
                /// next
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.jumpToPage(selectedIndex + 1);
                    });
                  },
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Row(
                      children: [
                        Text("Next Page",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700)),
                        SizedBox(width: 14),
                        Icon(Icons.arrow_forward,color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
