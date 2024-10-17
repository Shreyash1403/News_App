// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:news_app/view_model/view_model.dart';

// class CategoryScreen extends StatefulWidget {
//   const CategoryScreen({super.key});

//   @override
//   State<CategoryScreen> createState() => _CategoryScreenState();
// }

// class _CategoryScreenState extends State<CategoryScreen> {
//   final DateFormat format = DateFormat('MMMM dd, yyyy');
//   String categoryName = 'General';

//   List<String> categoryList = [
//     'General',
//     'Health',
//     'Sports',
//     'Business',
//     'Technology',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _fetchCategoryNews();
//   }

//   void _fetchCategoryNews() {
//     final viewModel = Provider.of<NewsViewModel>(context, listen: false);
//     viewModel.fetchCategoryNews(categoryName);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Category'),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: (value) {
//               setState(() {
//                 categoryName = value;
//                 _fetchCategoryNews();
//               });
//             },
//             itemBuilder: (BuildContext context) {
//               return categoryList.map((String category) {
//                 return PopupMenuItem<String>(
//                   value: category,
//                   child: Text(category),
//                 );
//               }).toList();
//             },
//           ),
//         ],
//       ),
//       body: Consumer<NewsViewModel>(
//         builder: (context, viewModel, child) {
//           final articles = viewModel.categoryModel?.articles;

//           if (articles == null) {
//             return const Center(child: CircularProgressIndicator()); // Loading
//           } else if (articles.isEmpty) {
//             return const Center(child: Text('No articles found.')); // No data
//           }

//           return LayoutBuilder(
//             builder: (context, constraints) {
//               double imageHeight = constraints.maxHeight * 0.15;
//               double imageWidth = constraints.maxWidth * 0.25;

//               // Display articles in a ListView
//               return ListView.builder(
//                 itemCount: articles.length,
//                 itemBuilder: (context, index) {
//                   final article = articles[index];
//                   DateTime date =
//                       DateTime.parse(article.publishedAt.toString());
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             height: imageHeight,
//                             width: imageWidth,
//                             child: article.urlToImage != null
//                                 ? Image.network(
//                                     article.urlToImage!,
//                                     fit: BoxFit.cover,
//                                   )
//                                 : Image.asset('assets/placeholder.png'),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   article.title ?? 'No title',
//                                   style: GoogleFonts.poppins(
//                                       fontWeight: FontWeight.bold),
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 2,
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   article.description ?? 'No description',
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 3,
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Expanded(
//                                       child: Text(
//                                         article.source?.name ??
//                                             'Unknown source',
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ),
//                                     Text(format.format(date)),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/view_model/view_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final DateFormat format = DateFormat('MMMM dd, yyyy');
  String categoryName = "General";

  List<String> categoryList = [
    'General',
    'Health',
    'Sports',
    'Business',
    'Technology',
  ];

  @override
  void initState() {
    super.initState();
    _fetchCategoryNews();
  }

  void _fetchCategoryNews() {
    final viewModel = Provider.of<NewsViewModel>(context, listen: false);
    viewModel.fetchCategoryNews(categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category News'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                height: 40,
                child: ListView.builder(
                  itemCount: categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              categoryName = categoryList[index];
                            });
                            _fetchCategoryNews();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: categoryName == categoryList[index]
                                  ? Colors.blue
                                  : Colors.blue[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              categoryList[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Consumer<NewsViewModel>(
                  builder: (context, viewModel, child) {
                    final articles = viewModel.categoryModel?.articles;

                    if (articles == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (articles.isEmpty) {
                      return const Center(child: Text('No articles found.'));
                    }

                    return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final article = articles[index];
                        DateTime date =
                            DateTime.parse(article.publishedAt.toString());
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  height: 80, // Fixed height for images
                                  width: 100, // Fixed width for images
                                  child: article.urlToImage != null
                                      ? Image.network(
                                          article.urlToImage!,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset('assets/placeholder.png'),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.title ?? 'No title',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        article.description ?? 'No description',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              article.source?.name ??
                                                  'Unknown source',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(format.format(date)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
