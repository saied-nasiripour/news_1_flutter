import 'dart:core';

class NewsInfo {
  final String? title;
  final String? author;
  final String? imageURL;
  final String? content;
  final DateTime dateTime;

  // Constructor
  const NewsInfo({
    this.title,
    this.author,
    this.imageURL,
    this.content,
    required this.dateTime,
  });

}
