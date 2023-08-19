import 'package:seventy_five/core/resources/data_state.dart';
import 'package:seventy_five/features/blogs/domain/entities/blog.dart';

abstract class BlogRepository {
  Future<DataState<List<BlogEntity>>> getBlogs();
}