import 'package:flutter/material.dart';
import 'package:dog_eared_books/models/book_entry.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:dog_eared_books/widgets/left_drawer.dart';
import 'package:dog_eared_books/widgets/book_detail.dart'; // Import the detail page

class BookEntryPage extends StatefulWidget {
  const BookEntryPage({super.key});

  @override
  State<BookEntryPage> createState() => _BookEntryPageState();
}

class _BookEntryPageState extends State<BookEntryPage> {
  Future<List<BookEntry>> fetchBooks(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');

    var data = response;

    List<BookEntry> listBooks = [];
    for (var d in data) {
      if (d != null) {
        listBooks.add(BookEntry.fromJson(d));
      }
    }
    return listBooks;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchBooks(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'There is no book data in Dog Eared Books',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final book = snapshot.data![index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailPage(book: book),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Border color
                            width: 1, // Border width
                          ),
                          borderRadius: BorderRadius.circular(12), // Border radius
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.fields.title,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text("Author: ${book.fields.author}"),
                            const SizedBox(height: 10),
                            Text("Genre: ${book.fields.genre}"),
                            const SizedBox(height: 10),
                            Text("Price: \$${book.fields.price}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
