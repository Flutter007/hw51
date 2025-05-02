import 'package:flutter/material.dart';
import 'package:hw51/screens/not_found_screen.dart';
import 'package:hw51/screens/panel_of_devices_screen.dart';
import 'package:hw51/screens/settings_of_devices_screen.dart';
import '../app_routes.dart';

typedef Routes = Map<String, Widget Function(BuildContext)>;

class HomeNavigationScreen extends StatefulWidget {
  const HomeNavigationScreen({super.key});

  @override
  State<HomeNavigationScreen> createState() => _HomeNavigationScreenState();
}

class _HomeNavigationScreenState extends State<HomeNavigationScreen> {
  int selectedIndex = 0;

  final Routes homeRoutes = {
    AppRoutes.home: (context) => PanelOfDevicesScreen(),
  };
  final Routes settingsRoutes = {
    AppRoutes.settings: (context) => SettingsOfDevicesScreen(),
  };

  MaterialPageRoute onGenerateRoute(Routes routes, RouteSettings settings) {
    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: settings);
    }
    return MaterialPageRoute(
      builder: (ctx) => NotFoundScreen(),
      settings: settings,
    );
  }

  List<Widget> get navigatorScreens => [
    Navigator(
      initialRoute: AppRoutes.home,
      onGenerateRoute: (settings) => onGenerateRoute(homeRoutes, settings),
    ),
    Navigator(
      initialRoute: AppRoutes.settings,
      onGenerateRoute: (settings) => onGenerateRoute(settingsRoutes, settings),
    ),
  ];

  void onDestinationSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: navigatorScreens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.broadcast_on_home),
            label: 'Home Page',
          ),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
