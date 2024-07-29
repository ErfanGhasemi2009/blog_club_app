import 'package:blog_club_app/data.dart';
import 'package:blog_club_app/gen/assets.gen.dart';
import 'package:blog_club_app/home.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeData.colorScheme.surface,
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(32, 32, 32, 48),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: themeData.colorScheme.surface,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20,
                              color: themeData.colorScheme.onBackground
                                  .withOpacity(0.1))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Assets.img.stories.story5
                                      .image(width: 84, height: 84)),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('@javiedan'),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text('Jovi Daviel',
                                          style: themeData.textTheme.bodyLarge),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'UX Designer',
                                        style: themeData.textTheme.bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    themeData.colorScheme.primary,
                                                fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About me',
                                style: themeData.textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                  'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                                  style: themeData.textTheme.bodyMedium)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    )),
                Positioned(
                    bottom: 0,
                    right: 96,
                    left: 96,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.5))
                      ]),
                    )),
                Positioned(
                  bottom: 16,
                  right: 72,
                  left: 72,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff2151CD),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '43',
                                  style: TextStyle(
                                      color: themeData.colorScheme.onPrimary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Post',
                                  style: themeData.textTheme.bodySmall!.apply(
                                      color: themeData.colorScheme.onPrimary),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '250',
                                style: TextStyle(
                                    color: themeData.colorScheme.onPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Following',
                                style: themeData.textTheme.bodySmall!.apply(
                                    color: themeData.colorScheme.onPrimary),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.5K',
                                style: TextStyle(
                                    color: themeData.colorScheme.onPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Followers',
                                style: themeData.textTheme.bodySmall!.apply(
                                    color: themeData.colorScheme.onPrimary),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24,),
            Container(
              decoration: BoxDecoration(
                color: themeData.colorScheme.background,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: themeData.colorScheme.onBackground.withOpacity(0.2)
                  )
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          'My Posts',
                          style: themeData.textTheme.headlineMedium,
                        )),
                        IconButton(
                            onPressed: () {}, icon: Assets.img.icons.grid.svg()),
                        IconButton(
                            onPressed: () {}, icon: Assets.img.icons.table.svg()),
                      ],
                    ),
                  ),
                  const PostList(),
                  const SizedBox(height: 12,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
