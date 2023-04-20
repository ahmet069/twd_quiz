import 'package:get_it/get_it.dart';

import 'data/datasources/local/question_datasource.dart';
import 'data/repositories/question_repository_impl.dart';
import 'domain/repositories/question_repository.dart';
import 'domain/usecase/question_usecase.dart';
import 'presentation/bloc/game_bloc/game_bloc.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector
    //* DATA SOURCES
    ..registerLazySingleton<QuestionDataSource>(() => QuestionDataSourceImpl())
    //* REPOSITORIES
    ..registerLazySingleton<QuestionRepository>(() => QuestionRepositoryImpl(injector()))
    //* USECASE
    ..registerLazySingleton<QuestionUsecase>(() => QuestionUsecase(injector()))
    //* BLOC
    ..registerFactory(() => GameBloc(injector()));
}
