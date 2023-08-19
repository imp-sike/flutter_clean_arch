import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seventy_five/core/resources/data_state.dart';
import 'package:seventy_five/features/blogs/domain/usecases/get_blogs.dart';
import 'package:seventy_five/features/blogs/presentation/bloc/blog/remote/remote_blog_event.dart';
import 'package:seventy_five/features/blogs/presentation/bloc/blog/remote/remote_blog_state.dart';

class RemoteBlogBloc extends Bloc<RemoteBlogEvent, RemoteBlogState> {
  
  final GetBlogsUseCase _getBlogsUseCase;
  
  RemoteBlogBloc(this._getBlogsUseCase): super(const RemoteBlogLoading()){
    on <GetBlogs> (onGetBlogs);
  }

  Future<void> onGetBlogs(GetBlogs event, Emitter<RemoteBlogState> emitter) async {
    final dataState = await _getBlogsUseCase();

    if(dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteBlogDone(dataState.data!));
    }


    if(dataState is DataError) {
      emit(RemoteBlogError(dataState.exception!));
    }
    
  }
}