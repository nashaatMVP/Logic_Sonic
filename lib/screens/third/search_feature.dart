import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFeature extends StatefulWidget {
  const SearchFeature({super.key});

  @override
  State<SearchFeature> createState() => _SearchFeatureState();
}

class _SearchFeatureState extends State<SearchFeature> {

  final TextEditingController _controller = TextEditingController();
  List<Map> products = [
    {
      "image" : "https://plus.unsplash.com/premium_photo-1664392147011-2a720f214e01?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title" : "Brown Women Bag",
      "price" : 70,
    },
    {
      "image" : "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title" : "White Watch 40",
      "price" : 130,
    },
    {
      "image" : "https://images.unsplash.com/photo-1541643600914-78b084683601?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title" : "Men Chanel Perfume",
      "price" : 2000,
    },
    {
      "image" : "https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title" : "Black Modern Glasses",
      "price" : 1400,
    },
    {
      "image" : "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2R1Y3R8ZW58MHx8MHx8fDA%3D",
      "title" : "Men Nike Shoes",
      "price" : 150,
    },
  ];
  List<Map> filterList = [];

  @override
  void initState() {
    filterList = products;
    super.initState();
  }

  void _searchFunction (String keyWord) {
    setState(() {
      filterList = products.where((product) {
        final title = product['title'].toString().toLowerCase();
        final input = keyWord.toLowerCase();
        return title.contains(input);
      }).toList();
    });
  }

  void _filterPrice() {
    setState(() {
      filterList = List<Map>.from(products);
      filterList.sort( (a , b) => b['price'].compareTo(a['price']));
    });
  }

  void _filterAlpha () {

    setState(() {

      filterList = List<Map>.from(products);

      filterList.sort( (a,b) => a['title'].compareTo(b['title']));

    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink.shade900,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 120),

              /// search text field
              SizedBox(
                height: 40,
                child: TextField(
                  controller: _controller,
                  cursorColor: Colors.black,
                  cursorHeight: 15,
                  onChanged: _searchFunction,
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(CupertinoIcons.search),
                    suffixIcon:
                    _controller.text != "" && _controller.text.isNotEmpty
                    ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _controller.text = '';
                          _searchFunction('');
                        });
                      },
                      child: Icon(
                          CupertinoIcons.clear,
                          size: 18,
                      ),
                    )
                    : SizedBox.shrink(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 3),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                  ),
                ),
              ),

              SizedBox(height: 30),

              /// categories
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _searchFunction("");
                    },
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text("All")),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      _searchFunction("Men");
                    },
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text("Men")),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      _searchFunction("Women");
                    },
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text("Women")),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      _searchFunction("Nike");
                    },
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text("Nike")),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              /// filter
              Row(
                children: [
                  /// high to low price
                  GestureDetector(
                    onTap: _filterPrice,
                    child: Row(
                      children: [
                        Icon(Icons.filter_alt , color: Colors.white),
                        SizedBox(width: 5),
                        Text("Highest to Lowest",style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        )),
                      ],
                    ),
                  ),

                  SizedBox(width: 10),

                  /// A to Z
                  GestureDetector(
                    onTap: _filterAlpha,
                    child: Row(
                      children: [
                        Icon(Icons.filter_list_sharp , color: Colors.white),
                        SizedBox(width: 5),
                        Text("A - Z",style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        )),
                      ],
                    ),
                  ),

                  Spacer(),


                  /// clear Filter
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        filterList = List<Map>.from(products);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.clear , color: Colors.white,size: 15),
                          SizedBox(width: 5),
                          Text("Clear Filter",style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(height: 15),

              /// Search List
              Column(
                children: List.generate(
                    filterList.length,
                  (index) {
                      final product = filterList[index];
                      return ListTile(
                         contentPadding: EdgeInsets.symmetric(vertical: 10),
                         leading: Container(
                           width: 70,
                           height: 200,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                           ),
                           child: ClipRRect(
                               borderRadius: BorderRadius.circular(12),
                               child: Image.network(
                                   product['image'],
                                   fit: BoxFit.cover,
                               ),
                           ),
                         ),
                         title: Text(
                             product['title'],
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 12,
                           ),
                         ),
                         trailing: Text(
                          "${product['price']}\$",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      );
                  },
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}
