import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:graphqldemo/core/constants/constants.dart';
import 'package:graphqldemo/features/mainApp/data/models/coverimage_model.dart';
import 'package:graphqldemo/features/mainApp/presentation/pages/blog_details_page.dart';

///blog row widget
class BlogRow extends StatefulWidget {
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
  final CoverimageModel? coverUrl;

  ///current blog
  final dynamic currentBlog;

  @override
  State<BlogRow> createState() => _BlogRowState();
}

class _BlogRowState extends State<BlogRow> {
  bool _isUrlNull = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isUrlNull= widget.coverUrl.isNull;
    });
  }
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(Constants.minimumPadding * 0.5),
      child: Card(
        child: ListTile(
          onTap: () {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (_) =>
                        BlogDetailsPage(currentBlog: widget.currentBlog)));
          },
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: _isUrlNull == false
                  ? Image.network(
                      widget.coverUrl!.url!,
                      height: 100,
                      width: 100,
                    )
                  : Container(
                    height: 100,
                    width: 100,
                    child: const FlutterLogo())),

          title: Text(
            widget.title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            widget.excerpt,
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
