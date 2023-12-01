
class AlertModel {
  String? name, id;
  String? messageAdmin;
  DateTime? dateNotific;
  bool? statut;

  AlertModel(
      {this.id,
      this.name,
      this.dateNotific,
      this.statut,
      this.messageAdmin});
}

final List<AlertModel> alerts = [
  AlertModel(
    id: "notif-1",
    messageAdmin:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna",
   
  ),
  AlertModel(
    id: "notif-2",
    messageAdmin:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna",
   
  ),
  AlertModel(
    id: "notif-3",
    messageAdmin:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna",
    
  ),
  AlertModel(
    id: "notif-4",
    messageAdmin:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna",
   
  ),
];
