import 'package:blog_club_app/carousel/carousel_slider.dart';
import 'package:blog_club_app/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String fontFamilyDefualt = "Avenir";
  static const Color primaryTextColor = Color(0xff0D253C);
  static const Color secondryTextColor = Color(0xff2D4379);
  static const Color textButtonTextColor = Color(0xff376AED);

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                textStyle: WidgetStatePropertyAll(
          TextStyle(
              fontFamily: fontFamilyDefualt,
              color: textButtonTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ))),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
            titleSmall: TextStyle(
                fontFamily: fontFamilyDefualt,
                color: secondryTextColor,
                fontWeight: FontWeight.w200,
                fontSize: 18),
            headlineLarge: TextStyle(
                color: primaryTextColor,
                fontFamily: fontFamilyDefualt,
                fontSize: 24,
                fontWeight: FontWeight.bold),
            bodySmall: TextStyle(
                color: secondryTextColor,
                fontFamily: fontFamilyDefualt,
                fontSize: 12),
            labelSmall: TextStyle(
                fontFamily: fontFamilyDefualt,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700),
            headlineMedium: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: primaryTextColor,
                fontFamily: fontFamilyDefualt),
            titleMedium: TextStyle(
                fontFamily: fontFamilyDefualt,
                color: primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            displaySmall: TextStyle(
                fontFamily: fontFamilyDefualt,
                fontWeight: FontWeight.w700,
                fontSize: 10,
                color: secondryTextColor)),
      ),
      home: Stack(children: [
        const Positioned.fill(child: HomeState()),
        Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation())
      ]),
    );
  }
}

class HomeState extends StatelessWidget {
  const HomeState({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Jonathan!',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Image.asset(
                      "assets/img/icons/notification.png",
                      width: 32,
                      height: 32,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: Text(
                  'Explore today’s',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              _StoryList(stories: stories),
              const SizedBox(
                height: 16,
              ),
              const _CategoryList(),
              const _PostList(),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          return _CategoryItem(
              left: realIndex == 0 ? 32 : 8,
              right: realIndex == categories.length - 1 ? 32 : 8,
              category: categories[realIndex]);
        },
        options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            aspectRatio: 1.2,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            scrollPhysics: const BouncingScrollPhysics(),
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            disableCenter: true));
  }
}

class _CategoryItem extends StatelessWidget {
  final double left;
  final double right;
  final Category category;
  const _CategoryItem({
    super.key,
    required this.category,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(children: [
        Positioned.fill(
          top: 100,
          right: 65,
          left: 65,
          bottom: 24,
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(119, 13, 37, 60), blurRadius: 20)
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(24)),
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Color(0xff0D253C), Colors.transparent])),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/img/posts/large/${category.imageFileName}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 48,
            left: 56,
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.labelSmall,
            ))
      ]),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    super.key,
    required this.stories,
  });

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
          itemCount: stories.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          itemBuilder: (context, index) {
            final story = stories[index];
            return _Story(story: story);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    super.key,
    required this.story,
  });

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(children: [
            story.isViewed ? _profileImageVisited() : _profileImageNotVisited(),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  width: 24,
                  height: 24,
                ))
          ]),
          const SizedBox(
            height: 4,
          ),
          Text(
            story.name,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }

  Widget _profileImageNotVisited() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB)
          ])),
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: Colors.white),
        padding: EdgeInsets.all(5),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageVisited() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        dashPattern: [8, 3],
        color: const Color(0xff7B8BB2),
        radius: const Radius.circular(24),
        padding: const EdgeInsets.all(7),
        child: Container(
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Image.asset('assets/img/stories/${story.imageFileName}'));
  }
}

class _PostList extends StatelessWidget {
  const _PostList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final postList = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lastest News',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextButton(
                style: TextButtonTheme.of(context).style,
                onPressed: () {},
                child: const Text('More',
                    style: TextStyle(color: MyApp.textButtonTextColor)),
              ),
            ],
          ),
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return _Post(
              post: postList[index],
            );
          },
          physics: const ClampingScrollPhysics(),
          itemCount: postList.length,
          itemExtent: 141,
          shrinkWrap: true,
        )
      ],
    );
  }
}

class _Post extends StatelessWidget {
  final PostData post;
  const _Post({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Color(0x1a5282FF), blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child:
                  Image.asset('assets/img/posts/small/${post.imageFileName}')),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.caption,
                    style: const TextStyle(
                        fontFamily: MyApp.fontFamilyDefualt,
                        color: MyApp.textButtonTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        CupertinoIcons.hand_thumbsup,
                        size: 16,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        post.likes,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Icon(
                        CupertinoIcons.clock,
                        size: 16,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        post.time,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          post.isBookmarked
                              ? CupertinoIcons.bookmark_fill
                              : CupertinoIcons.bookmark,
                          size: 16,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: const Color(0xff9b8487).withOpacity(0.3)),
              ]),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                      iconFileName: 'Home.png',
                      activeIconFileName: 'Home.png',
                      title: 'Home'),
                  _BottomNavigationItem(
                      iconFileName: 'Articles.png',
                      activeIconFileName: 'Articles.png',
                      title: 'Articles'),
                  SizedBox(
                    width: 8,
                  ),
                  _BottomNavigationItem(
                      iconFileName: 'Search.png',
                      activeIconFileName: 'Search.png',
                      title: 'Search'),
                  _BottomNavigationItem(
                      iconFileName: 'Menu.png',
                      activeIconFileName: 'Menu.png',
                      title: 'Menu'),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.5),
                    color: MyApp.textButtonTextColor,
                    border: Border.all(color: Colors.white, width: 4)),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;

  const _BottomNavigationItem(
      {required this.iconFileName,
      required this.activeIconFileName,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$iconFileName'),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}
