import 'package:get_it/get_it.dart';
import 'package:graphqldemo/features/mainApp/data/repositories/blog_repository_impl.dart';
import 'package:graphqldemo/features/mainApp/domain/repositories/blog_repository.dart';
import 'package:graphqldemo/features/mainApp/presentation/cubit/blog_cubit.dart';

///sl instance  object
final GetIt servicelocater = GetIt.instance;

///method for dependency initialization
Future<void> init() async {
  servicelocater
    ..registerFactory<BlogCubit>(() => BlogCubit(
          repository: servicelocater<BlogRepository>(), // Note the change here
        ))
    ..registerLazySingleton<BlogRepository>(() => BlogRepositoryImpl());
}


