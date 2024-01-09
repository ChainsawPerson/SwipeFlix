var name = 'Spiderman';
var link =
    'https://image.api.playstation.com/vulcan/ap/rnd/202306/1219/60eca3ac155247e21850c7d075d01ebf0f3f5dbf19ccd2a1.jpg';
bool isSaved = false;

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image(
          image: AssetImage('assets/Logo_update.png'),
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
            child: Image(
              image: AssetImage('assets/Icon button-darkSettings.png'),
            ),
          ),
        ],
        backgroundColor: Color(0xFF0D2C66),
        toolbarHeight: 73.0,
      ),
      body: Stack(
        children: [
          // Movie Poster
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image(
              image: NetworkImage(link),
            ),
          ),
          Column(
            // Column Of Title -> (Like/Dislike & Navigation Buttons)
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // Movie Title
                color: const Color(0xFFEFDBCB),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text(
                  '${name}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFF0D2C66),
                  ),
                ),
              ),
              Column(
                // Column of Swipe and Navigation
                children: [
                  // Swipe And Bookmark
                  Row(
                    // Row of Swipe & Bookmark
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Dislike
                      GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            int sensitivity = 2;
                            if (details.primaryDelta! < -sensitivity) {
                              // Swipe Left
                            }
                          },
                          child: const Image(
                              image:
                                  AssetImage('assets/DislikeAnimation.png'))),
                      // Save
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            isSaved
                                ? Icons.bookmark
                                : Icons.bookmark_add_outlined,
                          ),
                          iconSize: 50),
                      // Like
                      GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            int sensitivity = 2;
                            if (details.primaryDelta! > sensitivity) {
                              // Swipe Right
                            }
                          },
                          child: const Image(
                              image: AssetImage('assets/LikeAnimation.png'))),
                    ],
                  ),
                  // Navigation Buttons
                  Row(
                    // Row of Navigation Buttons
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.home_outlined),
                        color: const Color(0xFFEFDBCB),
                        iconSize: 35,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.list_outlined),
                        color: const Color(0xFFEFDBCB),
                        iconSize: 35,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        color: const Color(0xFFEFDBCB),
                        iconSize: 35,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
