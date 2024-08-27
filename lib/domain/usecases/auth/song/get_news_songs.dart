import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/core/usecases/usecase.dart';
import 'package:flutter_application_2/domain/repository/song/song.dart';

class GetNewsSongsUseCase implements Usecase<Either, dynamic> {
  final SongsRepository repository;

  GetNewsSongsUseCase(this.repository);

  @override
  Future<Either> call({params}) async {
    return await repository.getNewsSongs();
  }
}
