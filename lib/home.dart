import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zinnia/news.dart';

import 'home_view_model.dart';

class HomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shouldShowTab = ref.watch(
      homeViewModelProvider.select((value) => value.shouldShowTab),
    );
    final tabs = ref.watch(
      homeViewModelProvider.select((value) => value.tabs),
    );
    return DefaultTabController(
      length: shouldShowTab ? tabs.length : 1,
      child: Scaffold(
        appBar: shouldShowTab
            ? AppBar(
                title: const Text('Home'),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: tabs.map((e) => Tab(text: e)).toList(),
                ),
              )
            : AppBar(title: const Text('Home')),
        body: const NewsPage(),
        bottomNavigationBar: HookConsumer(
          builder: (context, ref, child) => BottomNavigationBar(
            currentIndex: ref.watch(
              homeViewModelProvider.select((value) => value.navigationIndex),
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
            ],
            onTap: (index) =>
                ref.read(homeViewModelProvider).onNavigationItemTapped(index),
          ),
        ),
      ),
    );
  }
}
