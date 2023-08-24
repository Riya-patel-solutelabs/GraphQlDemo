part of 'blog_cubit.dart';

///blogs state

abstract class BlogState extends Equatable {
  ///default constructor
  const BlogState();

  @override
  List<Object> get props => <Object>[];
}

///initila state
final class BlogInitial extends BlogState {}

///fetching blogs class
final class BlogLoading extends BlogState {}

///blogs fetched class
final class BlogLoaded extends BlogState {
  ///default initializer
  BlogLoaded({required this.blogList});

///list of blogs
  final List<BlogModel> blogList;
}

///blogs failure class
final class BlogFailure extends BlogState {}
