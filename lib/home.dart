import 'package:flutter/material.dart';
import 'package:flutter_local_notifications_tutorial/another_page.dart';
import 'package:flutter_local_notifications_tutorial/local_notifications.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    listenToNotifications();
    super.initState();
  }

//  to listen to any notification clicked or not
  listenToNotifications() {
    print("Listening to notification");
    LocalNotifications.onClickNotification.stream.listen((event) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AnotherPage(payload: event)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Local Notifications")),
      body: Container(
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.notifications_outlined),
                onPressed: () {
                  LocalNotifications.showSimpleNotification(
                      title: "Simple Notification",
                      body: "This is a simple notification",
                      payload: "This is simple data");
                },
                label: Text("Simple Notification"),
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.timer_outlined),
                onPressed: () {
                  LocalNotifications.showPeriodicNotifications(
                      title: "Periodic Notification",
                      body: "This is a Periodic Notification",
                      payload: "This is periodic data");
                },
                label: Text("Periodic Notifications"),
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.timer_outlined),
                onPressed: () {
                  LocalNotifications.showScheduleNotification(
                      title: "Schedule Notification",
                      body: "This is a Schedule Notification",
                      payload: "This is schedule data");
                },
                label: Text("Schedule Notifications"),
              ),
              // to close periodic notifications
              ElevatedButton.icon(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () {
                    LocalNotifications.cancel(1);
                  },
                  label: Text("Close Periodic Notifcations")),
              ElevatedButton.icon(
                  icon: Icon(Icons.delete_forever_outlined),
                  onPressed: () {
                    LocalNotifications.cancelAll();
                  },
                  label: Text("Cancel All Notifcations"))
            ],
          ),
        ),
      ),
    );
  }
}
