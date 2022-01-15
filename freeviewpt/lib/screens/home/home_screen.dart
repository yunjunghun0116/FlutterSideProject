import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../controller/filter_designer_controller.dart';
import '../../controller/designer_controller.dart';
import 'components/home_screen_advertising_area.dart';
import 'components/home_screen_google_map_area.dart';
import 'components/home_screen_recommend_artist_area.dart';
import 'components/home_screen_top_category_container.dart';
import 'components/home_screen_filtering_button_area.dart';
import 'components/home_screen_filtered_artist_area.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCategoryIndex = 0;
  final DesignerController _designerController = DesignerController.to;
  final FilterDesignerController _filterDesignerController =
      FilterDesignerController.to;

  final PageController _pageController = PageController(initialPage: 0);

  final ScrollController _firstScrollController = ScrollController();
  final ScrollController _secondScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  Widget _getMainArea() {
    return Expanded(
      child: PageView(
        allowImplicitScrolling: true,
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentCategoryIndex = index;
          });
        },
        children: [
          // First Page
          ListView(
            children: [
              const HomeScreenAdvertisingArea(),
              HomeScreenRecommendArtistArea(
                title: '추천 아티스트',
                designerList: _designerController.designerList,
              ),
              HomeScreenRecommendArtistArea(
                title: '가까운 아티스트',
                designerList: _designerController.designerList,
              ),
              HomeScreenRecommendArtistArea(
                title: '조회수 많은 아티스트',
                designerList: _designerController.designerList,
              ),
              HomeScreenRecommendArtistArea(
                title: '찜 많은 아티스트',
                designerList: _designerController.designerList,
              ),
              HomeScreenRecommendArtistArea(
                title: '포트폴리오 많은 아티스트',
                designerList: _designerController.designerList,
              ),
            ],
          ),
          // SecondPage
          CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HomeScreenGoogleMapArea(),
              ),
              SliverAppBar(
                titleSpacing: 0,
                backgroundColor: kWhiteColor,
                elevation: 0,
                pinned: true,
                title: HomeScreenFilteringButtonArea(
                    recommendTitle: _filterDesignerController.filteredRecommend,
                    shopCategoryTitle:
                        _filterDesignerController.filteredShopCategory,
                    refreshFunction: () => setState(() {})),
              ),
              SliverToBoxAdapter(
                child: HomeScreenFilteredArtistArea(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  HomeScreenTopCategoryContainer(
                    onTapFunction: () {
                      setState(() {
                        _currentCategoryIndex = 0;
                        _pageController.jumpToPage(0);
                      });
                    },
                    categoryTitle: '홈',
                    currentCategoryIndex: _currentCategoryIndex,
                    categoryIndex: 0,
                  ),
                  HomeScreenTopCategoryContainer(
                    onTapFunction: () {
                      setState(() {
                        _currentCategoryIndex = 1;
                        _pageController.jumpToPage(1);
                      });
                    },
                    categoryTitle: '내 주변',
                    currentCategoryIndex: _currentCategoryIndex,
                    categoryIndex: 1,
                  ),
                ],
              ),
              _getMainArea(),
            ],
          ),
        ],
      ),
    );
  }
}
