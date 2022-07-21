import 'dart:ui';
import 'package:book_app/models/book_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Detail", style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image atas
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(book.image), fit: BoxFit.cover)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Center(
                  child: Image.asset(book.image, width: 130),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                book.categoryBook,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
            ),
            // Rating DKK
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bookInfo("Rate", book.rate.toString()),
                  bookInfo("Page", book.page.toString()),
                  bookInfo("Language", book.language)
                ],
              ),
            ),
            // Description
            Container(
              margin: const EdgeInsets.only(left: 15, top: 5),
              child: const Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                book.description,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        )
      ]),
    );
  }

  Column bookInfo(String keyName, String keyValue) {
    return Column(
      children: [
        Text(
          keyValue,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        Text(keyName,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18))
      ],
    );
  }
}
