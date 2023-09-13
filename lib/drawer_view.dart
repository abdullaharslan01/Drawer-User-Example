import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerExample extends StatefulWidget {
  const DrawerExample({super.key});

  @override
  State<DrawerExample> createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample>
    with TickerProviderStateMixin {
  bool _showSubMenu = false;

  void showSubmenu() {
    setState(() {
      _showSubMenu = !_showSubMenu;
    });
  }

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage(Images image) {
      return AssetImage("lib/images/${image.name}.png");
    }

    List<Widget> generalMenu = [
      _DrawerListTile(
          iconLeading: Icon(FontAwesomeIcons.peopleArrows),
          menuName: "Shared with me"),
      _DrawerListTile(
          iconLeading: Icon(FontAwesomeIcons.star), menuName: "Started"),
      _DrawerListTile(iconLeading: Icon(Icons.download), menuName: "Offline"),
      _DrawerListTile(
          iconLeading: Icon(FontAwesomeIcons.trash), menuName: "Trash"),
      Divider(
        height: 2,
        color: Colors.black,
      ),
      _DrawerListTile(
          iconLeading: Icon(Icons.settings), menuName: "Settigns & account"),
      _DrawerListTile(iconLeading: Icon(Icons.exit_to_app), menuName: "Exit")
    ];

    List<_DrawerListTile> subTitleMenu = [
      _DrawerListTile(
          onTap: () {},
          iconLeading: CircleAvatar(
            backgroundImage: assetImage(Images.mainProfile),
          ),
          menuName: ProjeData.userName),
      _DrawerListTile(
          onTap: () {}, iconLeading: Icon(Icons.add), menuName: "Add Accout")
    ];

    List<CircleAvatar> otherProfiles = [
      CircleAvatar(
        backgroundImage: assetImage(Images.otherImage0),
      )
    ];

    return Scaffold(
      body: Container(
          child: SpinKitSpinningLines(
            size: MediaQuery.of(context).size.width * 0.9,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: assetImage(Images.background)))),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              arrowColor: ProjeData().arrowColor,
              onDetailsPressed: showSubmenu,
              otherAccountsPictures: otherProfiles,
              decoration:
                  _drawerHeaderBackground(assetImage(Images.background)),
              accountName: Text(ProjeData.userName),
              accountEmail: Text(ProjeData.email),
              currentAccountPicture:
                  _accountPicture(assetImage(Images.mainProfile)),
            ),
            _showSubMenu == true
                ? Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: subTitleMenu,
                    ),
                  )
                : SizedBox.shrink(),
            _DrawerListTile(
              iconLeading: Icon(FontAwesomeIcons.folder),
              menuName: "My Files",
              onTap: () {},
            ),
            Column(
              children: generalMenu,
            )
          ],
        ),
      ),
      appBar: AppBar(title: Text(ProjeData.appBarTitle)),
    );
  }

  BoxDecoration _drawerHeaderBackground(AssetImage image) {
    return BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        image: DecorationImage(fit: BoxFit.fill, image: image));
  }

  CircleAvatar _accountPicture(AssetImage image) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: image,
    );
  }
}

class _DrawerListTile extends StatelessWidget {
  const _DrawerListTile({
    required this.iconLeading,
    this.onTap,
    required this.menuName,
  });

  final Widget iconLeading;
  final Function()? onTap;
  final String menuName;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap ?? () {},
      leading: iconLeading,
      title: Text(menuName),
    );
  }
}

class ProjeData {
  static String appBarTitle = "Drawer Example";
  static String userName = "Abdullah Arslan";
  static String email = "abdullaharslan1473@gmail.com";

  Color arrowColor = Colors.white;
}

enum Images { background, mainProfile, otherImage0 }
