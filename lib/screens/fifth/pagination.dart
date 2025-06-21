import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  List<int> items = [];
  final ScrollController controller = ScrollController();
  bool isLoading = false;
  int currentPage = 1;
  final pageSize = 25;
  final maxPages = 3;


  /// fetchData
  Future<void> _fetchData (int page) async {
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 1));
    final start = (page - 1) * pageSize;
    final newItems = List.generate(pageSize, (index) => start + index);
    setState(() {
      items.addAll(newItems);
      setState(() => isLoading = false);
    });
  }

  @override
  void initState() {
    _fetchData(currentPage);

    controller.addListener(
        () {
          if(controller.position.pixels >= controller.position.maxScrollExtent - 100 && !isLoading && currentPage < maxPages) {
            _fetchData(currentPage++);
          }
        }
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade900,

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
                controller: controller,
                itemCount: items.length,
                itemBuilder: (context , index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10,left: 10),
                    child: Text(
                        "Product : $index",
                       style: TextStyle(color: Colors.white),
                    ),
                  );
                },
            ),
          ),

          if(isLoading)
          Padding(
            padding: const EdgeInsets.all(20),
            child: CupertinoActivityIndicator(color: Colors.white,radius: 15),
          ),

          if(!isLoading && currentPage == maxPages)
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("No More Data"),
            ),

        ],
      ),
    );
  }
}
