import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/fake_search.dart';

import '../galleries/accessories_gallery.dart';
import '../galleries/bags_gallery.dart';
import '../galleries/beauty_gallery.dart';
import '../galleries/electronics_gallery.dart';
import '../galleries/homegarden_gallery.dart';
import '../galleries/kids_gallery.dart';
import '../galleries/men_gallery.dart';
import '../galleries/shoes_gallery.dart';
import '../galleries/women_gallery.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade100.withOpacity(0.6),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const FakeSearch(),
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 8, 64, 148),
            indicatorWeight: 8,
            isScrollable: true,
            tabs: [
              RepeatedTab(label: 'Men'),
              RepeatedTab(label: 'Women'),
              RepeatedTab(label: 'Shoes'),
              RepeatedTab(label: 'Bags'),
              RepeatedTab(label: 'Electronics'),
              RepeatedTab(label: 'Accessories'),
              RepeatedTab(label: 'Home & Garden'),
              RepeatedTab(label: 'Kids'),
              RepeatedTab(label: 'Beauty'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MenFalleryScreen(),
            //Center(child: Text('men screen')),
            WomenGalleryScreen(),
            //Center(child: Text('women screen')),
            ShoesGalleryScreen(),
            BagsGalleryScreen(),
            ElectronicsGalleryScreen(),
            AccessoriesGalleryScreen(),
            HomeGardenGalleryScreen(),
            KidsGalleryScreen(),
            BeautyGalleryScreen(),
          ],
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
      ),
    );
  }
}
