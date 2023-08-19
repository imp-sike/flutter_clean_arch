import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:seventy_five/features/blogs/domain/entities/blog.dart';

abstract class RemoteBlogState extends Equatable {
  final List<BlogEntity>? blogs;
  final DioException? exception;

  const RemoteBlogState({this.blogs, this.exception});

  @override
  List<Object?> get props => [blogs!, exception!];
}

class RemoteBlogLoading extends RemoteBlogState {
  const RemoteBlogLoading();
}

class RemoteBlogDone extends RemoteBlogState {
  const RemoteBlogDone(List<BlogEntity> blogs) : super(blogs: blogs);
}

class RemoteBlogError extends RemoteBlogState {
  const RemoteBlogError(DioException exception) : super(exception: exception);
}
