// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:intl/intl.dart';
// // import 'package:news_app/model/news_model.dart';
// // import 'package:news_app/utils/enum.dart';
// // import 'package:news_app/view_model/view_model.dart';
// // import 'package:provider/provider.dart';

// // // ignore: must_be_immutable
// // class HomeScreen extends StatelessWidget {
// //   HomeScreen({super.key});

// //   final format = DateFormat('MMMM dd, yyyy');
// //   FilterList? selectedMenu;
// //   String name = 'bbc-news';
// //   @override
// //   Widget build(BuildContext context) {
// //     final screenWidth = MediaQuery.of(context).size.width;
// //     final cardWidth = screenWidth * 0.25;
// //     const imageHeight = 400.0;

// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: true,
// //         title: Text(
// //           "News App",
// //           style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold),
// //         ),
// //         actions: [
// //           PopupMenuButton<FilterList>(
// //               onSelected: (FilterList item) {
// //                 if (FilterList.bbcNews.name == item.name) {
// //                   name = 'bbc-news';
// //                 }

// //                 if (FilterList.aryNews.name == item.name) {
// //                   name = 'ary-news';
// //                 }
// //               },
// //               initialValue: selectedMenu,
// //               itemBuilder: (context) => <PopupMenuEntry<FilterList>>[
// //                     const PopupMenuItem(
// //                         value: FilterList.bbcNews, child: Text('BBC News')),
// //                     const PopupMenuItem(
// //                         value: FilterList.bbcNews, child: Text('ARY News')),
// //                     const PopupMenuItem(
// //                         value: FilterList.bbcNews, child: Text('BBC News')),
// //                   ]),
// //         ],
// //       ),
// //       body: FutureBuilder<NewsModel>(
// //         future: Provider.of<NewsViewModel>(context, listen: false).fetchNews(),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else {
// //             final articles = snapshot.data?.articles;

// //             return articles != null && articles.isNotEmpty
// //                 ? ListView.builder(
// //                     scrollDirection: Axis.horizontal,
// //                     itemCount: articles.length,
// //                     itemBuilder: (context, index) {
// //                       final article = articles[index];
// //                       DateTime date =
// //                           DateTime.parse(article.publishedAt.toString());
// //                       return Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: GestureDetector(
// //                           onTap: () {},
// //                           child: Column(
// //                             children: [
// //                               Container(
// //                                 width: cardWidth,
// //                                 child: Stack(children: [
// //                                   article.urlToImage != null
// //                                       ? ClipRRect(
// //                                           borderRadius:
// //                                               BorderRadius.circular(8.0),
// //                                           child: Image.network(
// //                                             article.urlToImage!,
// //                                             height: imageHeight,
// //                                             width: double.infinity,
// //                                             fit: BoxFit.cover,
// //                                           ),
// //                                         )
// //                                       : Container(
// //                                           height: imageHeight,
// //                                           color: Colors.grey,
// //                                           child: const Center(
// //                                               child: Text('No Image')),
// //                                         ),
// //                                   Positioned(
// //                                     bottom: 20,
// //                                     left: 0,
// //                                     right: 0,
// //                                     child: Padding(
// //                                       padding: const EdgeInsets.symmetric(
// //                                           horizontal: 8.0),
// //                                       child: Card(
// //                                         shape: RoundedRectangleBorder(
// //                                           borderRadius:
// //                                               BorderRadius.circular(12),
// //                                         ),
// //                                         child: Column(
// //                                           children: [
// //                                             Container(
// //                                               padding:
// //                                                   const EdgeInsets.all(8.0),
// //                                               alignment: Alignment.center,
// //                                               child: Text(
// //                                                 article.title ?? 'No Title',
// //                                                 style: const TextStyle(
// //                                                   fontWeight: FontWeight.bold,
// //                                                 ),
// //                                                 maxLines: 2,
// //                                                 overflow: TextOverflow.ellipsis,
// //                                                 textAlign: TextAlign
// //                                                     .center, // Center the text
// //                                               ),
// //                                             ),
// //                                             Padding(
// //                                               padding:
// //                                                   const EdgeInsets.all(8.0),
// //                                               child: Row(
// //                                                 mainAxisAlignment:
// //                                                     MainAxisAlignment
// //                                                         .spaceBetween,
// //                                                 children: [
// //                                                   Text(article.source!.name
// //                                                       .toString()),
// //                                                   Text(format.format(date))
// //                                                 ],
// //                                               ),
// //                                             )
// //                                           ],
// //                                         ),
// //                                       ),
// //                                     ),
// //                                   )
// //                                 ]),
// //                               ),
// //                               const SizedBox(
// //                                   height:
// //                                       10), // Adjusted spacing below the card
// //                               Text("Additional Info") // Example text
// //                             ],
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                   )
// //                 : const Center(child: Text('No articles available.'));
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

//THIS IS RUNNING CODE

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:news_app/model/news_model.dart';
// import 'package:news_app/view_model/view_model.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String name = 'bbc-news'; // Default source
//   DateFormat format = DateFormat('MMMM dd, yyyy');

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final cardWidth = screenWidth * 0.25;
//     const imageHeight = 400.0;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('News App'),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: (String source) {
//               // setState(() {
//               //   name = source; // Update the selected news source
//               // });
//
//             itemBuilder: (BuildContext context) {
//               return {'bbc-news', 'ary-news'}.map((String source) {
//                 return PopupMenuItem<String>(
//                   value: source,
//                   child: Text(source),
//                 );
//               }).toList();
//             },
//           ),
//         ],
//       ),
//       body: FutureBuilder<NewsModel>(
//         future:
//             Provider.of<NewsViewModel>(context, listen: false).fetchNews(name),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final articles = snapshot.data?.articles;

//             return articles != null && articles.isNotEmpty
//                 ? ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: articles.length,
//                     itemBuilder: (context, index) {
//                       final article = articles[index];
//                       DateTime date =
//                           DateTime.parse(article.publishedAt.toString());
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: GestureDetector(
//                           onTap: () {
//                             // Handle article tap (e.g., navigate to detail page)
//                           },
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: cardWidth,
//                                 child: Stack(
//                                   children: [
//                                     article.urlToImage != null
//                                         ? ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                             child: Image.network(
//                                               article.urlToImage!,
//                                               height: imageHeight,
//                                               width: double.infinity,
//                                               fit: BoxFit.cover,
//                                             ),
//                                           )
//                                         : Container(
//                                             height: imageHeight,
//                                             color: Colors.grey,
//                                             child: const Center(
//                                                 child: Text('No Image')),
//                                           ),
//                                     Positioned(
//                                       bottom: 20,
//                                       left: 0,
//                                       right: 0,
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 8.0),
//                                         child: Card(
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                           ),
//                                           child: Column(
//                                             children: [
//                                               Container(
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 alignment: Alignment.center,
//                                                 child: Text(
//                                                   article.title ?? 'No Title',
//                                                   style: const TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                   maxLines: 2,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   textAlign: TextAlign.center,
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Text(article.source!.name
//                                                         .toString()),
//                                                     Text(format.format(date)),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(
//                                   height: 10), // Space below the card
//                               const Text(
//                                   "Additional Info") // Placeholder for more info
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   )
//                 : const Center(child: Text('No articles available.'));
//           }
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:news_app/view/category_screen.dart';
// import 'package:news_app/view_model/view_model.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final DateFormat format = DateFormat('MMMM dd, yyyy');

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<NewsViewModel>(context, listen: false).fetchNews('bbc-news');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     final cardWidth = screenWidth * 0.5;
//     const imageHeight = 300.0;

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('News App'),
//         leading: AspectRatio(
//           aspectRatio: 1,
//           child: InkWell(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => const CategoryScreen()));
//               },
//               child:
//                   Image.asset('assets/category_icon.png', fit: BoxFit.cover)),
//         ),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: (String source) {
//               Provider.of<NewsViewModel>(context, listen: false)
//                   .setNewsSource(source);
//             },
//             itemBuilder: (BuildContext context) {
//               return {'bbc-news', 'ary-news'}.map((String source) {
//                 return PopupMenuItem<String>(
//                   value: source,
//                   child: Text(source),
//                 );
//               }).toList();
//             },
//           ),
//         ],
//       ),
//       body: Consumer<NewsViewModel>(
//         builder: (context, viewModel, child) {
//           final articles = viewModel.newsModel?.articles;

//           if (articles == null) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (articles.isEmpty) {
//             return const Center(child: Text('No articles available.'));
//           } else {
//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     height: screenHeight * 0.5,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: articles.length,
//                       itemBuilder: (context, index) {
//                         final article = articles[index];
//                         DateTime date =
//                             DateTime.parse(article.publishedAt.toString());

//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: GestureDetector(
//                             onTap: () {
//                               // Handle article tap
//                             },
//                             child: Container(
//                               width: cardWidth,
//                               child: Stack(
//                                 children: [
//                                   article.urlToImage != null
//                                       ? ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(8.0),
//                                           child: Image.network(
//                                             article.urlToImage!,
//                                             height: imageHeight,
//                                             width: double.infinity,
//                                             fit: BoxFit.cover,
//                                           ),
//                                         )
//                                       : Container(
//                                           height: imageHeight,
//                                           color: Colors.grey,
//                                           child: const Center(
//                                               child: Text('No Image')),
//                                         ),
//                                   Positioned(
//                                     bottom: 60,
//                                     left: 0,
//                                     right: 0,
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 8.0),
//                                       child: Card(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(12),
//                                         ),
//                                         child: Container(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 article.title ?? 'No Title',
//                                                 style: const TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                                 maxLines: 2,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 textAlign: TextAlign.left,
//                                               ),
//                                               const SizedBox(height: 8.0),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       article.source!.name
//                                                           .toString(),
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                     ),
//                                                   ),
//                                                   Text(format.format(date)),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/view/category_screen.dart';
import 'package:news_app/view/detail_screen.dart';
import 'package:news_app/view_model/view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DateFormat format = DateFormat('MMMM dd, yyyy');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final newsViewModel = Provider.of<NewsViewModel>(context, listen: false);
      newsViewModel.fetchNews('bbc-news').then((_) {
        newsViewModel.fetchCategoryNews('sports');
      });
    });
  }

  void _navigateToDetail(dynamic article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailScreen(
            newsImage: article.urlToImage ?? '',
            author: article.author ?? 'Unknown',
            newsTitle: article.title ?? 'No Title',
            newsDate:
                format.format(DateTime.parse(article.publishedAt.toString())),
            description: article.description ?? 'No Description',
            content: article.content ?? 'No Content',
            source: article.source?.name ?? 'Unknown Source',
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.5;
    const imageHeight = 250.0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('News App'),
        leading: AspectRatio(
          aspectRatio: 1,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoryScreen()),
              );
            },
            child: Image.asset('assets/category_icon.png', fit: BoxFit.cover),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String source) {
              Provider.of<NewsViewModel>(context, listen: false)
                  .setNewsSource(source);
            },
            itemBuilder: (BuildContext context) {
              return {'bbc-news', 'ary-news'}.map((String source) {
                return PopupMenuItem<String>(
                  value: source,
                  child: Text(source),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Consumer<NewsViewModel>(
        builder: (context, viewModel, child) {
          final articles = viewModel.newsModel?.articles;

          if (articles == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (articles.isEmpty) {
            return const Center(child: Text('No articles available.'));
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    height: screenHeight * 0.4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final article = articles[index];

                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                            onTap: () => _navigateToDetail(article),
                            child: Container(
                              width: cardWidth,
                              child: Stack(
                                children: [
                                  article.urlToImage != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            article.urlToImage!,
                                            height: imageHeight,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Container(
                                          height: imageHeight,
                                          color: Colors.grey,
                                          child: const Center(
                                              child: Text('No Image')),
                                        ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        elevation: 4,
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                article.title ?? 'No Title',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                              ),
                                              const SizedBox(height: 4.0),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      article.source!.name
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Text(format.format(
                                                      DateTime.parse(article
                                                          .publishedAt
                                                          .toString()))),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Consumer<NewsViewModel>(
                    builder: (context, viewModel, child) {
                      final categories = viewModel.categoryModel?.articles;

                      if (categories == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (categories.isEmpty) {
                        return const Center(
                            child: Text('No categories available.'));
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            return ListTile(
                              leading: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.network(
                                  category.urlToImage ??
                                      'https://example.com/default_image.png',
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                (loadingProgress
                                                        .expectedTotalBytes ??
                                                    1)
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                        'assets/placeholder_image.png');
                                  },
                                ),
                              ),
                              title: Text(category.title ?? 'No Title'),
                              onTap: () {},
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
