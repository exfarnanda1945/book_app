import 'package:book_app/models/book_model.dart';
import 'package:book_app/pages/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: Colors.lightBlue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Upgrade your skill\nUpgrade your life",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Image.asset(
                        "images/banner.png",
                        width: 100,
                        height: 100,
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Books",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                ),
                buildListBook()
              ],
            ),
          ),
        ));
  }

  ListView buildListBook() {
    return ListView.builder(
      itemCount: listBook.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, i) {
        final book = listBook[i];
        return GestureDetector(
          onTap: () {
            final route =
                MaterialPageRoute(builder: (ctx) => DetailPage(book: book));
            Navigator.push(context, route);
          },
          child: Container(
            width: double.infinity,
            height: 90,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.1),
                      blurRadius: 6.0)
                ]),
            child: Row(
              children: [
                Image.asset(
                  book.image,
                  width: 64,
                  height: 64,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      book.categoryBook,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
