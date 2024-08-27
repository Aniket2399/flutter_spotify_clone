import 'package:flutter_application_2/data/repository/auth/auth_repository_impl.dart';
import 'package:flutter_application_2/data/repository/song/song_repository_impl.dart';
import 'package:flutter_application_2/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_application_2/data/sources/song/song_firebase_service.dart';
import 'package:flutter_application_2/domain/repository/auth/auth.dart';
import 'package:flutter_application_2/domain/repository/song/song.dart';
import 'package:flutter_application_2/domain/usecases/auth/signin.dart';
import 'package:flutter_application_2/domain/usecases/auth/signup.dart';
import 'package:flutter_application_2/domain/usecases/auth/song/get_news_songs.dart';
import 'package:flutter_application_2/domain/usecases/auth/song/get_play_list.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SongsRepository>(SongRepositoryImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<GetNewsSongsUseCase>(
      GetNewsSongsUseCase(sl<SongsRepository>()));

  sl.registerSingleton<GetPlayListUseCase>(
      GetPlayListUseCase(sl<SongsRepository>()));
}
