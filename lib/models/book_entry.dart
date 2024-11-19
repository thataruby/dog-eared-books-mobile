// To parse this JSON data, do
//
//     final bookEntry = bookEntryFromJson(jsonString);

import 'dart:convert';

List<BookEntry> bookEntryFromJson(String str) => List<BookEntry>.from(json.decode(str).map((x) => BookEntry.fromJson(x)));

String bookEntryToJson(List<BookEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookEntry {
    String model;
    String pk;
    Fields fields;

    BookEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory BookEntry.fromJson(Map<String, dynamic> json) => BookEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String title;
    String author;
    int price;
    String genre;
    String summary;

    Fields({
        required this.user,
        required this.title,
        required this.author,
        required this.price,
        required this.genre,
        required this.summary,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        title: json["title"],
        author: json["author"],
        price: json["price"],
        genre: json["genre"],
        summary: json["summary"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "title": title,
        "author": author,
        "price": price,
        "genre": genre,
        "summary": summary,
    };
}
