import 'dart:io';

import 'package:dio/dio.dart';
import 'package:seventy_five/core/constants/constants.dart';
import 'package:seventy_five/features/blogs/data/data_sources/remote/blog_api_service.dart';
import 'package:seventy_five/features/blogs/data/models/blogs.dart';
import 'package:seventy_five/core/resources/data_state.dart';
import 'package:seventy_five/features/blogs/domain/repository/blog_repository.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogApiService _blogApiService;

  BlogRepositoryImpl(this._blogApiService);

  @override
  Future<DataState<List<BlogModel>>> getBlogs() async {
    try {
      final httpResponse = await _blogApiService.getBlogs(
          apiKey: blogAPIKey, category: categoryQuery, country: countryQuery);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
