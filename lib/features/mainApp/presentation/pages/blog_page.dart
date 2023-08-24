import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqldemo/features/mainApp/presentation/cubit/blog_cubit.dart';

import '../widgets/blog_row.dart';

///blog page class
class BlogPage extends StatefulWidget {
  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  String query = '''
query Content{
  posts{
    id
    author {
      name
    }
    title
    excerpt
    coverImage{
      url
    }
    content{
      text
    }
   
  }
}
''';

  @override
  Widget build(BuildContext context) => BlocConsumer<BlogCubit, BlogState>(
        listener: (BuildContext context, BlogState state) {
          print('current state is $state');
        },
        builder: (BuildContext context, BlogState state) {
          if (state is BlogLoading) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: const Text('GraphQl Demo Blog'),
              ),
              body: const Center(child: CircularProgressIndicator()),
            );
          }

          if (state is BlogLoaded) {
            final List<dynamic> posts = state.blogList;
            return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  title: const Text('GraphQl Demo Blog'),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Color.fromARGB(255, 4, 51, 93),
                  child: const Icon(Icons.add),
                  elevation: 10,
                ),
                body: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final dynamic post = posts[index];
                      // print(post['coverImage'][0]['url']);
                      // final dynamic title = post['title'];
                      // final dynamic excerpt = post['excerpt'];
                      // final dynamic coverUrl = post!['coverImage']['url'];


                    
                      return BlogRow(
                        title: post.title,
                        excerpt: post.excerpt,
                        coverUrl: post.coverImage.url,
                        currentBlog: post,
                      );
                    }));
          }

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: const Text('GraphQl Demo Blog'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color.fromARGB(255, 4, 51, 93),
              child: const Icon(Icons.add),
              elevation: 10,
            ),
            body: Query<Object>(
              options: QueryOptions<Object>(document: gql(query)),
              builder: (QueryResult<Object> result,
                  {FetchMore? fetchMore, VoidCallback? refetch}) {
                if (result.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (result.data == null) {
                  return const Text('No article found');
                } else {
                  final dynamic posts = result.data!['posts'];

                  return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final dynamic post = posts[index];
                        // print(post['coverImage'][0]['url']);
                        final dynamic title = post['title'];
                        final dynamic excerpt = post['excerpt'];
                        final dynamic coverUrl = post!['coverImage']['url'];
                        return BlogRow(
                          title: title,
                          excerpt: excerpt,
                          coverUrl: coverUrl,
                          currentBlog: post,
                        );
                      });
                }
              },
            ),
          );
        },
      );
}
