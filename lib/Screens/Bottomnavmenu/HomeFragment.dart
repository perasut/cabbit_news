import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_news/Screens/Bottomnavmenu/MenuList.dart';
import 'package:smart_news/Themes/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smart_news/Utils/Images.dart';
import 'package:smart_news/Utils/Widgets.dart';
import 'package:smart_news/Utils/constant.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:html/parser.dart' show parse;
import 'package:intl/intl.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  // สร้าง Object SharedPreferences
  SharedPreferences? sharedPreferences;

  String? fname, lname, email;
  int storeStep = 0;

  // กำหนดหมวดหมู่เริ่มต้น
  int? _categoryID = 0;

  // สร้าง TabController ไว้แสดง tab เมนู
  TabController? tabController;

  // สร้าง List ของ Tab เก็บลงตัวแปรแบบ Map
  Map<int, int> tabCategory = {
    0: 0,
    1: 12,
    2: 3,
    3: 2,
    4: 4,
    5: 5,
    6: 6,
    7: 1,
    8: 7,
    9: 11
  };

  List<Widget> tabs = [
    Tab(
      text: 'Home',
    ),
    Tab(
      text: 'Authoritative Parenting',
    ),
    Tab(
      text: 'Baby Games',
    ),
    Tab(
      text: 'Bathtime & Grooming',
    ),
    Tab(
      text: 'Diet',
    ),
    Tab(
      text: 'Health',
    ),
    Tab(
      text: 'Parental alienation',
    ),
    Tab(
      text: 'Parenting',
    ),
    Tab(
      text: 'Parenting coordinator',
    ),
    Tab(
      text: 'Paternal care',
    ),
  ];

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  getUserProfile() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      fname = sharedPreferences!.getString('storefirstName');
      lname = sharedPreferences!.getString('storelastName');
      email = sharedPreferences!.getString('storeemail');
      storeStep = sharedPreferences!.getInt('storeStep')!;
    });
  }

  _logout() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // Clear ค่าของ sharedPreferences ทั้งหมด
    // sharedPreferences!.clear();
    sharedPreferences!.setInt('storeStep', 0);
    Navigator.popAndPushNamed(context, '/login');
  }

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
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
          ],
          bottom: TabBar(
            tabs: tabs,
            labelPadding: EdgeInsets.only(left: 10, right: 10),
            controller: tabController,
            indicatorWeight: 4.0,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: primaryColor,
            labelColor: textColorSecondary,
            labelStyle: TextStyle(fontSize: 18.0),
            isScrollable: true,
            onTap: (index) {
              // print(index);
              setState(() {
                _categoryID = tabCategory[index];
              });

              print(_categoryID);
            },
          ),
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: googleColor),
          child: Drawer(
            child: ListView(
              children: [
                storeStep == 1
                    ? UserAccountsDrawerHeader(
                        accountName: Text('$fname $lname'),
                        accountEmail: Text('$email'),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage:
                              AssetImage('images/User_profile.png'),
                        ),
                        decoration: BoxDecoration(color: googleColor),
                      )
                    : Container(),

                // แบบแรก
                // for (final menu in menus)
                //   ListTile(
                //     leading: Icon(menu.micon),
                //     title: Text(menu.mname),
                //     onTap:() { menu.onTap(); },
                //   ),

                storeStep == 0
                    ? MenuList(
                        micon: Icons.login,
                        mname: 'Login',
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/login');
                        })
                    : Container(),

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

                storeStep == 1
                    ? MenuList(
                        micon: Icons.logout, mname: 'Logout', onTap: _logout)
                    : Container(),
              ],
            ),
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: tabs.map((e) {

            int index = tabs.indexOf(e);

            if(index == 0){

              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        HEAD_SLIDE_TEXT,
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),

                    Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: double.infinity,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 1.0,
                            enlargeCenterPage: false,
                            enableInfiniteScroll: false,
                            viewportFraction: 1.0,
                            autoPlay: true,
                          ),
                          items: imgList
                              .map((item) => Container(
                                    child: Center(
                                        child: Image.network(item,
                                            fit: BoxFit.cover, width: 1000)),
                                  ))
                              .toList(),
                        )),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        TEXT_LATEST_NEWS,
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),

                    for(int i=0; i<=5; i++)

                    GestureDetector(
                      onTap: () async {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: context.width(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Hero(
                              tag: "demo",
                              child: cachedImage(
                                      'http://192.168.1.49/flutter_news_api/wp-content/uploads/2021/06/angry-father-scolds-daughter-wife-family-problems_183219-4082.jpeg',
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover)
                                  .cornerRadiusWithClipRRect(10)
                                  .visible(
                                      "http://192.168.1.49/flutter_news_api/wp-content/uploads/2021/06/angry-father-scolds-daughter-wife-family-problems_183219-4082.jpeg"
                                          .isNotEmpty,
                                      defaultWidget: Image.asset(greyImage,
                                              fit: BoxFit.cover,
                                              height: 150,
                                              width: 150)
                                          .cornerRadiusWithClipRRect(10)),
                            ),
                            8.width,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    parseHtmlString(
                                        "Are you an authoritative parent? Here’s why it is good for your child"),
                                    style: boldTextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .color,
                                        size: textSizeMedium),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  8.height,
                                  Text(
                                    parseHtmlString(
                                        '<p>Do you allow your children to take independent decisions even while setting boundaries for them? In that case, you might be an authoritative parent.</p> <p>An authoritative parenting style is quite different from taking the authoritarian approach and calls for being nurturing and listening to kids rather than talking down to them and blindly enforcing rules. In the 1960s, developmental psychologist Diana Baumrind identified three <a class="" href="https://indianexpress.com/article/parenting/family/parenting-trends-2019-5611836/">parenting styles</a>–authoritative, authoritarian and permissive–based on the behaviour exhibited by preschoolers. Of these, the authoritative parenting style is characterised by high expectations and high responsiveness. An authoritative parent is responsive to the child’s needs but not indulgent. The parent sets rules and boundaries by open discussion and reasoning, which is why this parenting style is also called “democratic”.</p> <h2>Characteristics of authoritative parents</h2> <p>According to Baumrind, here are some common characteristics of authoritative parents:</p> <p>1. They listen to their children.</p> <p>2. They allow their children to express opinions.</p> <p>3. They encourage their children to discuss options.</p> <p>4. They foster independence and reasoning.</p> <p>5. They place limits, consequences, and expectations on their children’s behavior.</p> <p>6. They express warmth and nurturing.</p> <p>7. They administer fair and consistent discipline when rules are broken.</p> <p>8. They expect kids to act with responsibility but if they don’t, they are not given extreme punishment or allowed to get away with bad behaviour.</p> <div class="wp-block-image"><figure class="aligncenter size-large"><img loading="lazy" width="759" height="422" src="http://localhost/flutter_news_api/wp-content/uploads/2021/06/authoritative1.jpg" alt="Encourage kids to talk about their feelings. (Source: Getty Images)" class="wp-image-23" srcset="http://192.168.1.49/flutter_news_api/wp-content/uploads/2021/06/authoritative1.jpg 759w, http://192.168.1.49/flutter_news_api/wp-content/uploads/2021/06/authoritative1-300x167.jpg 300w" sizes="(max-width: 759px) 100vw, 759px" /><figcaption>Encourage kids to talk about their feelings. (Source: Getty Images)</figcaption></figure></div> <h2>Impact of authoritative parenting on children</h2> <p>As per Baumrind’s research, children with authoritative parents showed greater competence, exceptional maturity, assertiveness and self-control. According to Krevans &amp; Gibbs, such children display high levels of moral reasoning, moral conscience and prosocial behaviour. Again, children reared by authoritative parenting have a better mental health condition, as per a study published in European Online Journal of Natural and Social Sciences 2013. “Authoritative parents have unconditional love and acceptance of their children. Expressing love and acceptance helps children to feel safe. Secure children whose parents are authoritative are often cheerful, happy and have good mental health,” the study concluded.</p> <h2>Ways to practice authoritative parenting</h2> <h2>Encourage kids to talk about their feelings</h2> <p>Regular communication will allow you to gauge your child’s mood and draw them out when you feel they’re holding back something. Talk to them daily about their day at school, likes and dislike, favourite part of their day, etc. Create a safe space to confide in you if they are scared or upset.</p> <h2>Let them express their opinions</h2> <p>Allow your child to develop a mind of their own. Ask them why they prefer a certain toy, get their opinion on what they would like to sketch, games they like to play, etc. You could also check with them if you’re planning a vacation and allow them to pick places or suggest things to do during the holiday.</p> <h2>Make them self-reliant</h2> <p>Get them used to doing chores at an early age, even if it’s just putting away their play things or setting the table before meals, as they grow older. Watering plants, arranging their bookshelf or study table are some other useful chores. This will teach them to be independent in the long run.</p> <h2>Teach them discipline</h2> <p>By allowing kids to take charge of certain areas of their lives, you are teaching them key life skills. Let them make their own timetable for exams, plan their homework schedule and decide when they can have a cheat day for desserts or junk food</p>'),
                                    style:
                                        secondaryTextStyle(size: textSizeSMedium),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  8.height,
                                  Align(
                                    child: Text(
                                        DateFormat.yMMMMd('en_US').format(
                                            DateTime.parse(
                                                '2021-06-19T03:23:10')),
                                        style: secondaryTextStyle(size: 11)),
                                    alignment: Alignment.centerRight,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }else{
              return Center(child: Text('Other tabs'),);
            }
          }).toList(),
        ),
      ),
    );
  }

  String parseHtmlString(String? htmlString) {
    return parse(parse(htmlString).body!.text).documentElement!.text;
  }
}