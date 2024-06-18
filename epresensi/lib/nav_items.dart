import 'package:flutter/material.dart';

class NavItem {
  final IconData icon;
  final int index;

  NavItem({required this.icon, required this.index});
}

List<NavItem> navItems = [
  NavItem(icon: Icons.home, index: 0),
  NavItem(icon: Icons.edit, index: 1),
  NavItem(icon: Icons.fingerprint, index: 2),
  NavItem(icon: Icons.report, index: 3), // Set custom icon here
  NavItem(icon: Icons.person, index: 4),
];