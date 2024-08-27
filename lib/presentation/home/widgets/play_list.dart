import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/song/song.dart';
import 'package:flutter_application_2/presentation/home/bloc/play_list_cubit.dart';
import 'package:flutter_application_2/presentation/home/bloc/play_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayListCubit()..getPlayList(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          if (state is PlayListLoading) {
            print('State: LOADING');
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
          if (state is PlayListLoaded) {
            print('State: LOADED');
            return const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('PlayList'), Text('See more')],
                )
              ],
            );
          }

          return Container();
        },
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return Container();
  }
}
