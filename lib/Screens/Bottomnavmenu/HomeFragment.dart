import 'package:flutter/material.dart';
import 'package:smart_news/Screens/Bottomnavmenu/MenuList.dart';
import 'package:smart_news/Themes/colors.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Smart News',style: TextStyle(color: textColorSecondary),),
        actions: [
            IconButton(
              icon: Icon(Icons.video_call),
              onPressed: () {},
            )
        ]
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: googleColor
        ),
        child: Drawer(
          child: ListView(
            children: [
      
              UserAccountsDrawerHeader(
                accountName: Text('Samit Koyom'), 
                accountEmail: Text('samit@email.com'),
                currentAccountPicture: CircleAvatar(
                  // backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
                decoration: BoxDecoration(
                  color: googleColor
                ),
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
                onTap: (){
                  Navigator.pushNamed(context, '/login');
                }
              ),
      
              MenuList(
                micon: Icons.new_releases, 
                mname: 'Lastest news', 
                onTap: (){ 
                  Navigator.pushNamed(context, '/lastest_news');
                }
              ),
      
              MenuList(
                micon: Icons.category, 
                mname: 'Category', 
                onTap: (){ 
                  Navigator.pushNamed(context, '/category');
                }
              ),

              MenuList(
                micon: Icons.video_collection, 
                mname: 'Video Lists', 
                onTap: (){ 
                  Navigator.pushNamed(context, '/videolist');
                }
              ),
              
              MenuList(
                micon: Icons.info, 
                mname: 'About', 
                onTap: (){
                  Navigator.pushNamed(context, '/about');
                }
              ),

              MenuList(
                micon: Icons.settings, 
                mname: 'Setting', 
                onTap: (){
                  Navigator.pushNamed(context, '/setting');
                }
              ),

              MenuList(
                micon: Icons.logout, 
                mname: 'Logout', 
                onTap: (){ print('Logout tapped'); }
              ),
              
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(100.0),
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: googleColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top:35.0, left: 20.0,),
            child: Text('Home', style: TextStyle(fontSize: 24, color: white_color),),
          )
        ),
      ),
    );
  }
}