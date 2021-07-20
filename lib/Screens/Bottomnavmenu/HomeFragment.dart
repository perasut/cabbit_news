import 'package:flutter/material.dart';
import 'package:smart_news/Screens/Bottomnavmenu/MenuList.dart';
import 'package:smart_news/Themes/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Smart News',
            style: TextStyle(color: textColorSecondary),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.video_call),
              onPressed: () {},
            )
          ]),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: googleColor),
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Samit Koyom'),
                accountEmail: Text('samit@email.com'),
                currentAccountPicture: CircleAvatar(
                    // backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    ),
                decoration: BoxDecoration(color: googleColor),
              ),

              // แบบแรก
              // for (final menu in menus)
              //   ListTile(
              //     leading: Icon(menu.micon),
              //     title: Text(menu.mname),
              //     onTap:() { menu.onTap(); },
              //   ),

              MenuList(
                  micon: Icons.login,
                  mname: 'Login',
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/login');
                  }),

              MenuList(
                  micon: Icons.new_releases,
                  mname: 'Lastest news',
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/lastest_news');
                  }),

              MenuList(
                  micon: Icons.category,
                  mname: 'Category',
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/category');
                  }),

              MenuList(
                  micon: Icons.video_collection,
                  mname: 'Video Lists',
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/videolist');
                  }),

              MenuList(
                  micon: Icons.info,
                  mname: 'About',
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/about');
                  }),

              MenuList(
                  micon: Icons.settings,
                  mname: 'Setting',
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/setting');
                  }),

              MenuList(
                  micon: Icons.logout,
                  mname: 'Logout',
                  onTap: () {
                    print('Logout tapped');
                  }),
            ],
          ),
        ),
      ),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(),
        items: imgList
            .map((item) => Container(
                  child: Center(
                      child:
                          Image.network(item, fit: BoxFit.cover, width: 1000)),
                ))
            .toList(),
      )),
    );
  }
}
