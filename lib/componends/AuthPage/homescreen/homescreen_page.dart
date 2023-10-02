import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapi_app/componends/AuthPage/homescreen/explorecat.dart';
import 'package:newsapi_app/model/category.dart';
import 'package:newsapi_app/services/api_services.dart';
import 'package:newsapi_app/services/tesla_services.dart';
import 'package:newsapi_app/services/topnews_services.dart';

import '../../../model/content_model.dart';
import '../newsfeedscreen/feed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
final List<Tab> myTabs = <Tab> [
    const Tab(text: 'GADJETS'),
    const Tab(text: 'TECH'),
    const Tab(text: 'TOP NEWS'),
  ];

class _HomeScreenState extends State<HomeScreen> {
  ApiService client = ApiService();
  TeslaServiceApi teslaServiceApi  = TeslaServiceApi();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF001F3F),
          centerTitle: true,
          title: Text(
            "Subspace",
            style: GoogleFonts.judson(fontSize: 31),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.dashboard , size: 25,))
          ],
          bottom: TabBar(
            tabs: myTabs,
            labelColor: Colors.blue, // Set the label/text color
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red, 
            ),
        ),
        body:  TabBarView(
          children: [
            Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 12),
                  width: MediaQuery.of(context).size.width,
                  height: 61,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: categoryList
                          .map((e) => exploreSections(category: e))
                          .toList()),
                )
              ],
            ),
            FutureBuilder(
              future: ApiService.getArticle(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.hasData) {
                  List<Article>? article = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: article?.length,
                      itemBuilder: (context, index) =>
                          customListTile(article![index], context),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
          Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: CarcategoryList
                          .map((e) => exploreSections(category: e))
                          .toList()),
                )
              ],
            ),
            FutureBuilder(
              future: TeslaServiceApi.getTeslaArticle(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.hasData) {
                  List<Article>? article = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: article?.length,
                      itemBuilder: (context, index) =>
                          customListTile(article![index], context),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
          Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: TopNewscategoryList
                          .map((e) => exploreSections(category: e))
                          .toList()),
                )
              ],
            ),
            FutureBuilder(
              future: TopNewsServices.getTopNewsArticle(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.hasData) {
                  List<Article>? article = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: article?.length,
                      itemBuilder: (context, index) =>
                          customListTile(article![index], context),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
          ],
          ),
      ),
    );
  }
}
