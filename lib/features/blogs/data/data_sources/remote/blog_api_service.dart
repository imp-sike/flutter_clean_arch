import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seventy_five/core/constants/constants.dart';
import 'package:seventy_five/features/blogs/data/models/blogs.dart';

part 'blog_api_service.g.dart';

@RestApi(baseUrl: blogAPIBASEUrl)
abstract class BlogApiService {
  factory BlogApiService(Dio dio) = _BlogApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<BlogModel>>> getBlogs(
      {
        @Query("apiKey") String? apiKey,
        @Query("country") String? country,
        @Query("category") String? category,
      
      });
}
