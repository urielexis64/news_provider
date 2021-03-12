import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
        onTap: (i) => navigationModel.currentPage = i,
        currentIndex: navigationModel.currentPage,
        items: [
          BottomNavigationBarItem(
              label: 'For you', icon: Icon(Icons.person_outline)),
          BottomNavigationBarItem(label: 'Headlines', icon: Icon(Icons.public))
        ]);
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: navigationModel.pageController,
      children: [
        Container(color: Colors.red),
        Container(color: Colors.green),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  PageController _pageController = PageController();

  int get currentPage => _currentPage;
  PageController get pageController => _pageController;

  set currentPage(int value) {
    this._currentPage = value;
    _pageController.animateToPage(value,
        duration: Duration(milliseconds: 250), curve: Curves.easeIn);
    notifyListeners();
  }
}
