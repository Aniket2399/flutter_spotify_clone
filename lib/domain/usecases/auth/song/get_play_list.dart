import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/core/usecases/usecase.dart';
import 'package:flutter_application_2/domain/repository/song/song.dart';
import 'package:flutter_application_2/service_locator.dart';

class GetPlayListUseCase implements Usecase<Either, dynamic> {
  final SongsRepository repository;

  GetPlayListUseCase(this.repository);

  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getPlayList();
  }
}
