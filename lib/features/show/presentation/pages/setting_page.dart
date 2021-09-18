import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant2/core/util/scheduling_provider.dart';

class SettingPage extends StatelessWidget {
  var routeName = '';

    @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SchedulingProvider>(
      create: (_) => SchedulingProvider(),
      child: Scaffold(
        body: _buildList(context),
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Settings'),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: [
        Material(
          child: ListTile(
            title: Text('Restaurant notification'),
            trailing: Consumer<SchedulingProvider>(
               builder: (context, scheduled, _) {
                return Switch.adaptive(
                  value: scheduled.isScheduled,
                  onChanged: (value) async {
                    scheduled.scheduledNews(value);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}