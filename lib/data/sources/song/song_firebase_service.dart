import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/data/models/auth/song/song.dart';
import 'package:flutter_application_2/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection("Songs")
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromjson(element.data());
        songs.add(songModel.toEntity());
      }
      print(songs);
      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, Please try again. ');
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection("Songs")
          .orderBy('releaseDate', descending: true)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromjson(element.data());
        songs.add(songModel.toEntity());
      }
      print(songs);
      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, Please try again. ');
    }
  }
}
