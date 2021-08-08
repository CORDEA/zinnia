import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zinnia/news.dart';

import 'home_view_model.dart';

class HomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const NewsPage(),
      bottomNavigationBar: HookConsumer(
        builder: (context, ref, child) => BottomNavigationBar(
          currentIndex: ref.watch(
            homeViewModelProvider.select((value) => value.navigationIndex),
          ),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'News'),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',
            ),
          ],
          onTap: (index) =>
              ref.read(homeViewModelProvider).onNavigationItemTapped(index),
        ),
      ),
    );
  }
}
