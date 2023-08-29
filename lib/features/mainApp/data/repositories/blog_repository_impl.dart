import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqldemo/features/mainApp/data/models/blog_model.dart';
import 'package:graphqldemo/features/mainApp/data/repositories/grapghql_config.dart';
import 'package:graphqldemo/features/mainApp/domain/repositories/blog_repository.dart';
import 'package:logger/src/logger.dart';

import '../../../../core/utils/log_extension.dart';

///repo implementationइ
class BlogRepositoryImpl extends BlogRepository {
  ///log var for logging
  final Logger log = logger;

  @override
  Future<BlogModel> addBlogs(BlogModel blog) async {
    final BlogModel newBlog = blog;

    String mutationQuery() => '''
    mutation AddBlog(\$title: String!, \$excerpt: String!, \$content: String!, \$authorName: String!) {
  createPost(data:{
    title: \$title,
    excerpt: \$excerpt,
    content: \$content,
    author:{create:{name: \$authorName}}
    
  }){
    id
    title
    excerpt
    content
    author{
    
      name
    }
  }
}
''';

    final Map<String, dynamic> variables = <String, dynamic>{
      'title': blog.title,
      'excerpt': blog.excerpt,
      'content': blog.content,
      'authorName': blog.author!.name,
    };
    BlogModel newblogModel = const BlogModel();
    try {
      final GrapghqlConfig grapghqlConfiguration = GrapghqlConfig();
      final GraphQLClient _client = grapghqlConfiguration.clientToQuery();

      final QueryResult<Object> result = await _client.mutate(
          MutationOptions<Object>(
              document: gql(mutationQuery()), variables: variables));

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        final Map<String, dynamic> responseData = result.data!['createPost'];
        final BlogModel newblogModel = BlogModel.fromJson(responseData);
        log.i(newblogModel);
      }
      return newblogModel;
    } on Exception catch (_) {
      return newblogModel;
    }
  }

  @override
  Future<List<BlogModel>> getBlogs() async {
    const String inputQuery = '''
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
    content
   
  }
}
''';
    final List<BlogModel> blogModelList = <BlogModel>[];
    try {
      final GrapghqlConfig grapghqlConfiguration = GrapghqlConfig();
      final GraphQLClient _client = grapghqlConfiguration.clientToQuery();

      final QueryResult<Object> result =
          await _client.query(QueryOptions<Object>(document: gql(inputQuery)));

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        final List<dynamic> blogs = result.data!['posts'];

        for (final dynamic blogData in blogs) {
          final BlogModel blogModel = BlogModel.fromJson(blogData);
          blogModelList.add(blogModel);
        }
      }
      return blogModelList;
    } on Exception catch (e) {
      print(e);
      return blogModelList;
    }
  }
}
