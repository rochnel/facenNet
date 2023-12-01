import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_net_authentication/domain/entities/alert_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertScreen extends StatefulWidget {
  @override
  _AlertScreenState createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.orange,
            title: const Text(
              'Notifications',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: alerts.length,
              itemBuilder: (context, index) {
                final notificationListe = alerts[index];
                return CardNotification(
                  retrievednotificationList: notificationListe,
                  onDismis: (direction) {
                    setState(() {
                      alerts.removeAt(index);
                    });

                    Get.snackbar("Confirmation!", "Notification supprimé",
                        animationDuration: const Duration(milliseconds: 100),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red.withOpacity(0.3));
                  },
                );
              },
            )));
  }
}

// ignore: must_be_immutable
class CardNotification extends StatefulWidget {
  CardNotification({ this.retrievednotificationList, this.onDismis});
  AlertModel? retrievednotificationList;
  Function(DismissDirection)? onDismis;
  @override
  State<CardNotification> createState() => _CardNotificationState();
}

class _CardNotificationState extends State<CardNotification> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * (1 / 812.0);
    var width = MediaQuery.of(context).size.width * (1 / 375.0);
    return Center(
        child: Container(
      child: Dismissible(
        confirmDismiss: (DismissDirection direction) async {
          return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Confirmation"),
                content: const Text(
                    "Etes vous sûr de vouloir supprimer cette notification?"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text("SUPPRIMER")),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text("ANNULER"),
                  ),
                ],
              );
            },
          );
        },
        key: Key(widget.retrievednotificationList!.id!),
        direction: DismissDirection.endToStart,
        onDismissed: widget.onDismis,
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              // width: width * 360,
              color: Colors.white,
              child: Row(children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: 'assets/images/Rectangle.png',
                          fit: BoxFit.cover,
                          imageBuilder: (context, imageProvider) => Container(
                            width: width * 50,
                            height: height * 50,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )),
                ),
                Container(
                  width: width * 230,
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.retrievednotificationList!.id!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.retrievednotificationList!.messageAdmin!),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green,
                                  width: 1.0,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.phone,
                                  fill: 1,
                                  color: Colors.green,
                                  size: 15,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 1.0,
                                ),
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    CupertinoIcons.chat_bubble,
                                    fill: 1,
                                    weight: 50,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
