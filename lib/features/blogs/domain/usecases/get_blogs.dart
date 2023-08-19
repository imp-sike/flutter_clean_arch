import 'package:seventy_five/core/resources/data_state.dart';
import 'package:seventy_five/core/usecases/usecase.dart';
import 'package:seventy_five/features/blogs/data/models/blogs.dart';
import 'package:seventy_five/features/blogs/domain/entities/blog.dart';
import 'package:seventy_five/features/blogs/domain/repository/blog_repository.dart';

class GetBlogsUseCase implements UseCase<DataState<List<BlogEntity>>, void> {
  
  final BlogRepository _blogRepository;

  GetBlogsUseCase(this._blogRepository);
  
  @override
  Future<DataState<List<BlogEntity>>> call({void params}) {
    return _blogRepository.getBlogs();
  }
}