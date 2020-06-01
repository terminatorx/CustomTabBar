import 'package:flutter/material.dart';
import 'package:CustomTabBar/custom_tab_bar.dart' as Custom;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CustomTabBar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _controller;
  TabController _controller2;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 6, vsync: this);
    _controller2 = TabController(length: 6, vsync: this);
    _controller.index = 0;
    _controller2.index = 0;
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Title(color: Colors.black, child: Text("默认TabBar")),
            Container(
              color: Colors.blue,
              child: TabBar(
                controller: this._controller,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.white,
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(fontSize: 15.0),
                indicatorWeight: 3.0,
                isScrollable: true,
                indicatorPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                tabs: [
                  Tab(text: '动态'),
                  Tab(text: '热门'),
                  Tab(text: '附近'),
                  Tab(text: '颜值'),
                  Tab(text: '音乐'),
                  Tab(text: '跳舞'),
                ],
              ),
            ),
            Container(
              height: 100.0,
              color: Colors.red,
              child: TabBarView(
                controller: this._controller,
                children: [
                  Text("内容1"),
                  Text("内容2"),
                  Text("内容3"),
                  Text("内容4"),
                  Text("内容5"),
                  Text("内容6"),
                ],
              ),
            ),
            Title(color: Colors.black, child: Text("修改后的TabBar")),
            Container(
              color: Colors.blue,
              child:
              Custom.TabBar(
                controller: this._controller2,
                indicatorSize: Custom.TabBarIndicatorSize.label,
                indicatorColor: Colors.white,
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(fontSize: 15.0),
                indicatorWeight: 3.0,
                isScrollable: true,
                indicatorPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                tabs: [
                  Tab(text: '动态'),
                  Tab(text: '热门'),
                  Tab(text: '附近'),
                  Tab(text: '颜值'),
                  Tab(text: '音乐'),
                  Tab(text: '跳舞'),
                ],
              ),
            ),
            Container(
              height: 100.0,
              color: Colors.red,
              child: TabBarView(
                controller: this._controller2,
                children: [
                  Text("内容1"),
                  Text("内容2"),
                  Text("内容3"),
                  Text("内容4"),
                  Text("内容5"),
                  Text("内容6"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
