import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/data/sources/song/song_firebase_service.dart';
import 'package:flutter_application_2/domain/repository/song/song.dart';
import 'package:flutter_application_2/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }
}
