
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphqldemo/features/mainApp/data/models/blog_model.dart';
import 'package:graphqldemo/features/mainApp/domain/repositories/blog_repository.dart';


part 'blog_state.dart';

///blog cubit to handle blog functions
class BlogCubit extends Cubit<BlogState> {
  ///default initializer
  BlogCubit({required this.repository}) : super(BlogInitial());

  ///blog repo var
  final BlogRepository repository;

  ///method to fetch blogs
  Future<void> fetchBlogs() async {
    emit(BlogLoading());
    try {
      final List<BlogModel> blogsList = await repository.getBlogs();

      emit(BlogLoaded(blogList: blogsList));
    } on Exception catch (e) {
      emit(BlogFailure());
    }
  }
}
