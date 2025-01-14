import 'package:flutter/material.dart';
import 'package:flutter_application_2/common/helpers/is_dark_mode.dart';
import 'package:flutter_application_2/core/configs/assets/app_images.dart';
import 'package:flutter_application_2/core/configs/assets/app_vectors.dart';
import 'package:flutter_application_2/core/configs/theme/app_colors.dart';
import 'package:flutter_application_2/presentation/home/widgets/news_songs.dart';
import 'package:flutter_application_2/presentation/home/widgets/play_list.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widgets/appbar/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _homeTopCard(),
              _tabs(),
              SizedBox(
                height: 260,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const NewsSongs(),
                    Container(),
                    Container(),
                    Container(),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const PlayList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return SizedBox(
      height: 130,
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(left: 28, right: 28),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              AppVectors.homeTopCard,
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 40, bottom: 5),
              child: Image.asset(AppImages.homeArtist),
            )),
      ]),
    );
  }

  Widget _tabs() {
    return Align(
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        dividerColor: Colors.transparent,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        indicatorColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        tabs: const [
          Text(
            'News',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            'Videos',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            'Artists',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            'Podcasts',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
