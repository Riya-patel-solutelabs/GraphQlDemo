import 'package:flutter/material.dart';
import 'package:graphqldemo/core/constants/constants.dart';

///blog details page
class BlogDetailsPage extends StatefulWidget {
  ///default initializer
  const BlogDetailsPage({required this.currentBlog, super.key});

  ///current blog var
  final dynamic currentBlog;

  @override
  State<BlogDetailsPage> createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {
  @override
  Widget build(BuildContext context) {
    // final dynamic blogTitle = currentBlog['title'];

    // final dynamic coverUrl = currentBlog!['coverImage']['url'];
    // final dynamic author = currentBlog['author']['name'];
    // final dynamic content= currentBlog['content']['text'];

    final dynamic blogTitle = widget.currentBlog.title;
    final dynamic coverUrl = widget.currentBlog.coverImage;
    final dynamic author = widget.currentBlog.author.name;
    final dynamic content = widget.currentBlog.content;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Constants.minimumPadding * 3),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Center(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: coverUrl != null
                      ? Image.network(
                          coverUrl.url,
                          fit: BoxFit.cover,
                        )
                      : const FlutterLogo(size: Constants.minimumPadding*10,),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                blogTitle,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'By $author',
                textAlign: TextAlign.end,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                content,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
