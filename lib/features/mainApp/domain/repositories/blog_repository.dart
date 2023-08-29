import 'package:graphqldemo/features/mainApp/data/models/blog_model.dart';

///blog repo 
abstract class BlogRepository {
  ///function to get blogs
  Future<List<BlogModel>> getBlogs();

  ///function to add blogs
  Future<BlogModel> addBlogs(BlogModel blog);
}
