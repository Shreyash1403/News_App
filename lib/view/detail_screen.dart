import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String newsImage;
  final String newsTitle;
  final String newsDate;
  final String author;
  final String description;
  final String content;
  final String source;

  const DetailScreen({
    Key? key,
    required this.author,
    required this.newsImage,
    required this.newsTitle,
    required this.newsDate,
    required this.description,
    required this.content,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            newsImage.isNotEmpty
                ? Image.network(newsImage)
                : Container(
                    height: 200,
                    color: Colors.grey,
                    child: const Center(child: Text('No Image')),
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsTitle,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text("By $author on $newsDate"),
                  const SizedBox(height: 16),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    content,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text("Source: $source"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
