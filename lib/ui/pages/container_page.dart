import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_app/routes/app_router.gr.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        CoreRoute(),
        ProfileRoute(),
        ProfileRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  CupertinoIcons.home,
                  color: Colors.black,
                )),
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  CupertinoIcons.graph_circle,
                  color: Colors.black,
                )),
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  CupertinoIcons.news,
                  color: Colors.black,
                )),
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  CupertinoIcons.person,
                  color: Colors.black,
                )),
          ]),
    );
  }
}
