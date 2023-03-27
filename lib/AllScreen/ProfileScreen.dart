import 'package:flutter/material.dart';
import 'package:foodheaven/AllScreen/homeScreen.dart';

import 'LoginScreen.dart';

class ProfileScreen extends StatelessWidget {
  static String idScreen = "profile";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: Container(
              color: Colors.white54,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    leading: IconButton(
                        onPressed: () {
                          Navigator.restorablePushNamedAndRemoveUntil(
                              context, HomeScreen.idScreen, (route) => false);
                        },
                        icon: Icon(Icons.arrow_back_sharp)),
                    trailing:
                        IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        maxRadius: 65,
                        backgroundImage: NetworkImage(
                            "https://media.licdn.com/dms/image/D5603AQFTPFfOA8Sygg/profile-displayphoto-shrink_800_800/0/1675060728932?e=2147483647&v=beta&t=1Fs6yW1U6NBu579gR3kLDJZq-HRk_wrqibbOAZ4QmI0"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.facebook))),
                      SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.mail))),
                      SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                  Icons.transfer_within_a_station_rounded))),
                      SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.window))),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Khairul Islam Zibon",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 26),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text("Zibon@gmail.com")],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Expanded(
                        child: ListView(
                      children: [
                        Card(
                          margin: const EdgeInsets.only(
                              left: 35, right: 35, bottom: 10),
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const ListTile(
                            leading: Icon(
                              Icons.privacy_tip_sharp,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Privacy',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white70,
                          margin: const EdgeInsets.only(
                              left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const ListTile(
                            leading: Icon(
                              Icons.history,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Purchase History',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white70,
                          margin: const EdgeInsets.only(
                              left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const ListTile(
                            leading:
                                Icon(Icons.help_outline, color: Colors.black54),
                            title: Text(
                              'Help & Support',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white70,
                          margin: const EdgeInsets.only(
                              left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const ListTile(
                            leading: Icon(
                              Icons.privacy_tip_sharp,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Settings',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white70,
                          margin: const EdgeInsets.only(
                              left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const ListTile(
                            leading: Icon(
                              Icons.add_reaction_sharp,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Invite a Friend',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white70,
                          margin: const EdgeInsets.only(
                              left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const ListTile(
                            leading: Icon(
                              Icons.logout,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        )
                      ],
                    )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
