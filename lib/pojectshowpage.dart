import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProjectShowPage extends StatefulWidget {
  const ProjectShowPage({Key? key}) : super(key: key);

  @override
  State<ProjectShowPage> createState() => _ProjectShowPageState();
}

class _ProjectShowPageState extends State<ProjectShowPage> {
  late YoutubePlayerController ycontroler;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ycontroler = YoutubePlayerController(initialVideoId:"9UFumHBhsqE",flags:YoutubePlayerFlags(autoPlay: true));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: _onPageChanged,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:Image.asset("assets/image1.jpeg")
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:Image.asset("assets/image1.jpeg")
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.width * 9 / 16,

  decoration: BoxDecoration(
    color: Colors.blueGrey,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child:  YoutubePlayerBuilder(
        player: YoutubePlayer(controller: ycontroler),
        builder: (context, player) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: player,
          );
        },
      ),

  ),
),



                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: _currentPage == index ? 20 : 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.blueAccent
                        : Colors.grey[400],
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.blueAccent),
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.blueAccent),
                  onPressed: () {
                    if (_currentPage < 2) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
