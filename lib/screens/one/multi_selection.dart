import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List<String> types = [
    "News",
    "Health",
    "Cooking",
    "Entertainment",
    "Sport",
    "Football",
    "Tech",
    "Flutter",
    "Ai",
    "Trending",
    "Fashion & Dressing",
    "LifeStyle",
  ];
  Set<String> emptyType = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 140),
            Text("What do you want to see on X?",style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
            SizedBox(height: 30),
            Wrap(
              spacing: 30,
              runSpacing: 10,
              children: List.generate(
                  types.length,
                  (index) {
                    final type = types[index];
                    final isSelected = emptyType.contains(type);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if(!isSelected) {
                            emptyType.add(type);
                          } else {
                            emptyType.remove(type);
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 350),
                        curve: Curves.easeIn,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        child: Text(
                          type,
                          style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        )),
                      ),
                    );
              }),
            ),
            SizedBox(height: 30),

            // => i changed this into  listview to avoid flex error <=
            /// empty List
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: emptyType.map((v) {
                  return Text(v,style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
