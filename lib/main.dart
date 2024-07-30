import 'package:blog_club_app/article.dart';
import 'package:blog_club_app/home.dart';
import 'package:blog_club_app/profileScreen.dart';
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
  static const Color primaryColor = Color(0xff376AED);

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Club',
      theme: ThemeData(
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                textStyle: WidgetStatePropertyAll(
          TextStyle(
              fontFamily: fontFamilyDefualt,
              color: primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ))),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          background: Color(0xffFbFCFF),
          surface: Colors.white,
          onSurface: primaryTextColor,
          onBackground: primaryTextColor,
        ),
        appBarTheme: AppBarTheme(
            color: Theme.of(context).colorScheme.surface,
            titleSpacing: 32,
            foregroundColor: Theme.of(context).colorScheme.onBackground),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryColor,
        ),
        useMaterial3: false,
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
                fontFamily: fontFamilyDefualt,
                color: secondryTextColor,
                fontWeight: FontWeight.w700,
                fontSize: 18),
            bodyMedium: TextStyle(
                color: secondryTextColor,
                fontFamily: fontFamilyDefualt,
                fontSize: 14),
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
      // home: Stack(children: [
      //   const Positioned.fill(child: HomeState()),
      //   Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation())
      // ]),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeScreenIndex = 0;
const int articleScreenIndex = 1;
const int searchScreenIndex = 2;
const int menuScreenIndex = 3;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeScreenIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 65,
            child: IndexedStack(
              index: selectedScreenIndex,
              children: const [
                HomeState(),
                ArticleScreen(),
                SearchScreen(),
                ProfileScreen()
              ],
            ),
          ),
           Positioned(
            bottom: 0,
            right: 0,
            left: 0,
             child: _BottomNavigation(
                     onSelectedTab: (index) {
                       setState(() {
              selectedScreenIndex = index;
                       });
                     },
                     selectedTab: selectedScreenIndex,
                   ),
           ),
        ],
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Search screen"),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onSelectedTab;
  final int selectedTab;
  const _BottomNavigation(
      {super.key, required this.onSelectedTab, required this.selectedTab});
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
                    color: const Color(0xff9b8487).withOpacity(0.5)),
              ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                    iconFileName: 'Home.png',
                    activeIconFileName: 'Home.png',
                    title: 'Home',
                    isActive: selectedTab == homeScreenIndex,
                    onTap: () {
                      onSelectedTab(homeScreenIndex);
                    },
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Articles.png',
                    activeIconFileName: 'Articles.png',
                    title: 'Articles',
                    isActive: selectedTab == articleScreenIndex,
                    onTap: () {
                      onSelectedTab(articleScreenIndex);
                    },
                  ),
                  Expanded(child: Container()),
                  _BottomNavigationItem(
                    iconFileName: 'Search.png',
                    activeIconFileName: 'Search.png',
                    title: 'Search',
                    isActive: selectedTab == searchScreenIndex,
                    onTap: () {
                      onSelectedTab(searchScreenIndex);
                    },
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Menu.png',
                    activeIconFileName: 'Menu.png',
                    title: 'Menu',
                    isActive: selectedTab == menuScreenIndex,
                    onTap: () {
                      onSelectedTab(menuScreenIndex);
                    },
                  ),
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
                    color: MyApp.primaryColor,
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
  final Function() onTap;
  final bool isActive;

  const _BottomNavigationItem(
      {required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTap,
      required this.isActive});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/icons/$iconFileName'),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: isActive
                  ? Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .apply(color: Theme.of(context).colorScheme.primary)
                  : Theme.of(context).textTheme.displaySmall,
            )
          ],
        ),
      ),
    );
  }
}
