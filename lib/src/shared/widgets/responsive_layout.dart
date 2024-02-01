import 'package:flutter/material.dart';

import 'package:stopwatches_plus/generated/l10n.dart';
import 'package:stopwatches_plus/themes/tokens.dart' as t;

class ResponsiveLayout extends StatefulWidget {
  final List<Widget> pages;
  final List<BottomNavigationBarItem> items;
  final void Function()? onNavigate;
  final Widget? floatingActionButton;

  const ResponsiveLayout({
    Key? key,
    this.floatingActionButton,
    required this.pages,
    required this.items,
    this.onNavigate,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  bool _isPageChanging = false;

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600.0;
    final labels = widget.items.map((item) => item.label).toList();
    final buttons = labels
        .map((label) => TextButton(
            onPressed: () {
              _navigateToPage(labels.indexOf(label));
            },
            child: Text(label!)))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.appTitle),
        actions: isSmallScreen ? [] : buttons,
      ),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      bottomNavigationBar: isSmallScreen
          ? BottomNavigationBar(
              items: widget.items,
              currentIndex: _currentPageIndex,
              onTap: _navigateToPage,
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: t.Spacing.s16),
          child: PageView(
            controller: _pageController,
            children: widget.pages,
            onPageChanged: (index) {
              if (!_isPageChanging) {
                setState(() {
                  _isPageChanging = true;
                  _currentPageIndex = index;
                });
                Future.delayed(Duration.zero, () {
                  _isPageChanging = false;
                });
              }
            },
          ),
        ),
      ),
    );
  }

  void _navigateToPage(int index) {
    if (!_isPageChanging) {
      _pageController.jumpToPage(
        index,
      );
      widget.onNavigate?.call();
    }
  }
}
