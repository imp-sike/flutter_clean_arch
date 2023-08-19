import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:seventy_five/features/blogs/data/data_sources/remote/blog_api_service.dart';
import 'package:seventy_five/features/blogs/data/repository/blog_repository_impl.dart';
import 'package:seventy_five/features/blogs/domain/repository/blog_repository.dart';
import 'package:seventy_five/features/blogs/domain/usecases/get_blogs.dart';
import 'package:seventy_five/features/blogs/presentation/bloc/blog/remote/remote_blog_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<BlogApiService>(BlogApiService(sl()));

  sl.registerSingleton<BlogRepository>(BlogRepositoryImpl(sl()));

  // usecases
  sl.registerSingleton<GetBlogsUseCase>(GetBlogsUseCase(sl()));

  // blocs
  sl.registerFactory<RemoteBlogBloc>(() => RemoteBlogBloc(sl()));
  
}
