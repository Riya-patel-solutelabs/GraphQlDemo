import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqldemo/features/mainApp/data/models/blog_model.dart';
import 'package:graphqldemo/features/mainApp/data/repositories/grapghql_config.dart';
import 'package:graphqldemo/features/mainApp/domain/repositories/blog_repository.dart';

class BlogRepositoryImpl extends BlogRepository {
  @override
  Future<void> addBlogs(BlogModel blog) async {
    // TODO: implement addBlogs
    throw UnimplementedError();
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
    content{
      text
    }
   
  }
}
''';
    List<BlogModel> blogModelList = [];
    try {
      final GrapghqlConfig grapghqlConfiguration = GrapghqlConfig();
      final GraphQLClient _client = grapghqlConfiguration.clientToQuery();

      final QueryResult<Object> result =
          await _client.query(QueryOptions<Object>(document: gql(inputQuery)));

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        List<dynamic> blogs= result.data!['posts'];

        for(var blogData in blogs){
          BlogModel blogModel= BlogModel.fromJson(blogData);
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
