import 'package:fire_Social/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/icon_broken.dart';
import '../about_developer/about_developer.dart';
import '../favorites_screen/favorites_screen.dart';
import '../watch_later_Screen/watch_later_Screen.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                InkWell(
                  onTap: (() {
                    navigateTo(context, FavoritesScreen());
                  }),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          width: double.infinity,
                          image: NetworkImage(
                              "https://img.freepik.com/free-vector/background-with-white-feathers-with-gold-glitter-confetti-empty-space-vector-poster-with-realistic-illustration-flying-golden-colored-bird-angel-quills-sparkles-ribbons_107791-9934.jpg?w=900"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(IconBroken.Heart),
                              SizedBox(width: 5),
                              Text(
                                "Favorites",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${SocialCubit.get(context).favoritesList.length}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: (() {
                    navigateTo(context, WatchLaterScreen());
                  }),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          width: double.infinity,
                          image: NetworkImage(
                              "https://img.freepik.com/free-vector/early-morning-cartoon-nature-landscape-sunrise_107791-10161.jpg?t=st=1645370428~exp=1645371028~hmac=657740f90dc7aa5221be339ebccd4bb10d433641f923f198fbf1c73f065e3967&w=900"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(IconBroken.Time_Circle),
                              SizedBox(width: 5),
                              Text(
                                "Watch Later",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${SocialCubit.get(context).watchLaterList.length}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                buttonPadding: EdgeInsets.all(20),
                                title: Row(
                                  children: [
                                    Icon(Icons.info_outline),
                                    SizedBox(width: 5),
                                    Text("Social App"),
                                  ],
                                ),
                                content: Text(
                                    "Sorry, this service is not available yet"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ok"),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 5.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.help_outline,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Help",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, AboutDeveloperScreen());
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 5.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "About developer",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: defaultButton(
                      function: () {
                        SocialCubit.get(context).signOut(context);
                      },
                      text: "Log Out"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
