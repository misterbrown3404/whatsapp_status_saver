import 'package:flutter/material.dart';
import 'package:whatsapp_status_saver/application/extensions/context_extentions.dart';
import 'package:whatsapp_status_saver/shared/presentation/ui/drawer/status_saver_drawer.dart';
import 'package:whatsapp_status_saver/src/home/presentation/screens/images_tab.dart';
import 'package:whatsapp_status_saver/src/home/presentation/screens/saved_status_tab.dart';
import 'package:whatsapp_status_saver/src/home/presentation/screens/videos_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  late  final l10n = context.l10n;
     // Check if `l10n` is properly loaded
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appName ?? 'Default App Name'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.images ?? 'Images'),
            Tab(text: l10n.videos ?? 'Videos'),
            Tab(text: l10n.saved ?? 'Saved'),
          ],
        ),
      ),
      drawer: const Drawer(child: StatusSaverDrawer()),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ImageStatus(),
          VideosStatus(),
          SavedStatusTab(),
        ],
      ),
    );
  }
}
