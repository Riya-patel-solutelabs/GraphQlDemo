import 'package:flutter/material.dart';
import 'package:graphqldemo/core/constants/constants.dart';
import 'package:graphqldemo/features/mainApp/presentation/pages/blog_details_page.dart';

///blog row widget
class BlogRow extends StatelessWidget {
  ///default initializer
  const BlogRow(
      {required this.title,
      required this.excerpt,
      required this.coverUrl,
      required this.currentBlog,
      super.key});

  ///title of blog
  final String title;

  ///description of blog
  final String excerpt;

  ///cover url of blog
  final String coverUrl;

  ///current blog
  final dynamic currentBlog;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(Constants.minimumPadding * 5),
        child: Card(
          child: ListTile(
            onTap: () {
              Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (_) =>
                          BlogDetailsPage(currentBlog: currentBlog)));
            },
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: coverUrl != null
                    ? Image.network(
                        coverUrl,
                        height: 100,
                        width: 100,
                      )
                    : const FlutterLogo()),

            title: Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              excerpt,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),

            //   Expanded(
            //       flex: 2,
            //       child: Column(
            //         children: <Widget>[
            //           Text(
            //             title,
            //             style: Theme.of(context).textTheme.headlineLarge,
            //           ),
            //           const SizedBox(
            //             height: 10,
            //           ),
            //           Text(
            //             excerpt,
            //             style: Theme.of(context).textTheme.bodyMedium,
            //           ),
            //         ],
            //       ))
            // ],
          ),
        ),
      );
}
