import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'successPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(PinPage());
}

class PinPage extends StatelessWidget {
  Color red = Color(0xFFBD0008);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            BackgroundContent(),
            SafeArea(
              child: Column(
                children: [
                  HeadContent(red: red),
                  MainContent(),
                  NavigationContent(red: red)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NavigationContent extends StatelessWidget {
  const NavigationContent({
    Key key,
    @required this.red,
  }) : super(key: key);

  final Color red;

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);

    return Container(
      width: screen.size.width,
      height: screen.size.height * 10 / 100,
      padding: EdgeInsets.all(screen.size.height * 1 / 100),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          spreadRadius: 0,
          blurRadius: 6,
          offset: Offset(0, -1),
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screen.size.height * 5 / 100,
                height: screen.size.height * 5 / 100,
                padding: EdgeInsets.all(screen.size.height * 1 / 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: red,
                ),
                child: Image.asset('assets/icons/paper-plane.png'),
              ),
              Text(
                'Kirim',
                style: TextStyle(
                  color: red,
                  fontSize: 10,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screen.size.height * 5 / 100,
                height: screen.size.height * 5 / 100,
                padding: EdgeInsets.all(screen.size.height * 1 / 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: red,
                ),
                child: Image.asset('assets/icons/inbox.png'),
              ),
              Text(
                'Terima',
                style: TextStyle(
                  color: red,
                  fontSize: 10,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BackgroundContent extends StatelessWidget {
  const BackgroundContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 50 / 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/cover.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HeadContent extends StatelessWidget {
  const HeadContent({
    Key key,
    @required this.red,
  }) : super(key: key);

  final Color red;

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    List pin = [];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: screen.size.height * 7 / 100,
          width: screen.size.height * 7 / 100,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: red,
          ),
          child: Image.asset(
            'assets/icons/settings.png',
            width: 20,
          ),
        ),
        Container(
          height: screen.size.height * 7 / 100,
          width: screen.size.height * 7 / 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: red,
            image: DecorationImage(
              image: AssetImage('assets/images/user.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: screen.size.height * 7 / 100,
          width: screen.size.height * 7 / 100,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: red,
          ),
          child: Image.asset(
            'assets/icons/bell.png',
            width: 20,
          ),
        ),
      ],
    );
  }
}

class MainContent extends StatefulWidget {
  const MainContent({
    Key key,
  }) : super(key: key);

  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  List<int> pin = [];

  @override
  Widget build(BuildContext context) {
    Color red = Color(0xFFBD0008);
    double padding = 15.0;
    var number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    MediaQueryData screen = MediaQuery.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * 83 / 100 - 25,
      width: MediaQuery.of(context).size.width * 100 / 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 50,
                height: 8,
                decoration: BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            //Main Content Here
            Container(
              margin: EdgeInsets.only(top: screen.size.height * 10 / 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 6; i++)
                    Column(
                      children: [
                        pin.length > i
                            ? Container(
                                width: screen.size.width * 3 / 100,
                                height: screen.size.width * 3 / 100,
                                decoration: BoxDecoration(
                                  color: red,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              )
                            : Container(
                                width: screen.size.width * 3 / 100,
                                height: screen.size.width * 3 / 100,
                              ),
                        Container(
                          margin: EdgeInsets.only(
                              top: padding,
                              left: screen.size.width * 10 / 100 / 6),
                          width: screen.size.width * 10 / 100,
                          height: screen.size.width * 1 / 100,
                          decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),

            Container(
              width: screen.size.width * 80 / 100 - padding,
              child: Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                children: [
                  for (var item in number)
                    GestureDetector(
                      onTap: () {
                        pin.add(item);
                        print(pin);
                        print(pin.length);
                        setState(() {});
                      },
                      child: Container(
                        width: screen.size.width * 80 / 100 / 3 - padding,
                        padding: EdgeInsets.all(screen.size.width * 5 / 100),
                        child: Center(
                          child: Text(
                            item.toString(),
                            style: TextStyle(fontSize: 35, color: red),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SuccessPage()));
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: screen.size.width * 27 / 100 - (padding * 4)),
                width: screen.size.width - padding,
                height: screen.size.width * 13 / 100,
                decoration: BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    "Kirim",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            //end of main content
          ],
        ),
      ),
    );
  }
}
