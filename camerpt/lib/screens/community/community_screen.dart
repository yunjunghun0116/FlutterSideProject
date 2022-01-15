import 'package:camerpt/components/screen_title.dart';
import 'package:camerpt/constants.dart';
import 'package:camerpt/controllers/post_controller.dart';
import 'package:camerpt/models/post.dart';
import 'package:camerpt/screens/community/components/community_screen_board_filter_button.dart';
import 'package:camerpt/screens/community/components/community_screen_game_filter_button.dart';
import 'package:camerpt/screens/community/components/community_screen_post_card.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final PostController _postController = PostController.to;
  List<Post> _postList = [];
  int _currentGameIndex = 0;
  int _currentBoardIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postList = _postController.postList;
  }

  Widget _getPostList(List<Post> postList) {
    String? _gameTitle;
    String? _boardTitle;
    switch (_currentGameIndex) {
      case 0:
        _gameTitle = '롤';
        break;
      case 1:
        _gameTitle = '배틀그라운드';
        break;
      case 2:
        _gameTitle = '오버워치';
        break;
      default:
        _gameTitle = '롤';
        break;
    }
    if (_currentBoardIndex == 0) {
      _boardTitle = '자유게시판';
    } else {
      _boardTitle = '정보게시판';
    }
    return Column(
      children: postList.map((Post post) {
        return CommunityScreenPostCard(
          gameTitle: _gameTitle!,
          boardTitle: _boardTitle!,
          postId: '1234', //TODO postId 이곳에
          title: post.title,
          content: post.content,
          timeStamp: post.timeStamp,
          authorId: post.authorId,
          authorName: post.authorName,
          likeCount: post.likeCount,
          recommentList: post.recommentList,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScreenTitle(title: '커뮤니티'),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: kUnSelectedColor,
                ),
              ),
            ),
            child: Row(
              children: [
                CommunityScreenGameFilterButton(
                  title: '롤',
                  onPressed: () {
                    setState(() {
                      _currentGameIndex = 0;
                    });
                  },
                  currentGameIndex: _currentGameIndex,
                  gameIndex: 0,
                ),
                CommunityScreenGameFilterButton(
                  title: '배틀그라운드',
                  onPressed: () {
                    setState(() {
                      _currentGameIndex = 1;
                    });
                  },
                  currentGameIndex: _currentGameIndex,
                  gameIndex: 1,
                ),
                CommunityScreenGameFilterButton(
                  title: '오버워치',
                  onPressed: () {
                    setState(() {
                      _currentGameIndex = 2;
                    });
                  },
                  currentGameIndex: _currentGameIndex,
                  gameIndex: 2,
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: kUnSelectedColor,
                ),
              ),
            ),
            child: Row(
              children: [
                CommunityScreenBoardFilterButton(
                  title: '자유게시판',
                  onPressed: () {
                    setState(() {
                      _currentBoardIndex = 0;
                    });
                  },
                  currentBoardIndex: _currentBoardIndex,
                  boardIndex: 0,
                ),
                CommunityScreenBoardFilterButton(
                  title: '정보게시판',
                  onPressed: () {
                    setState(() {
                      _currentBoardIndex = 1;
                    });
                  },
                  currentBoardIndex: _currentBoardIndex,
                  boardIndex: 1,
                ),
              ],
            ),
          ),
          _getPostList(_postList),
        ],
      ),
    );
  }
}
