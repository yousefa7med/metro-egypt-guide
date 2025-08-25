import 'package:metro_egypt_guide/core/Helper/metro_helper/models/station_model.dart';

class TripDetailsModel {
  int? stationCount;
  int? time;
  int? ticketPrice;
  List<List<StationModel>> routes = [];
  List<StationModel> directions = [];

  void clear() {
    directions.clear();
    routes.clear();
    stationCount = null;
    time = null;
    ticketPrice = null;
  }

  void setStationCount(int stationCount) => this.stationCount = stationCount;

  void setTicketPrice(int numOfStation) {
    if (numOfStation <= 9) {
      ticketPrice = 8;
    } else if (numOfStation <= 16) {
      ticketPrice = 10;
    } else if (numOfStation <= 23) {
      ticketPrice = 15;
    } else {
      ticketPrice = 20;
    }
  }
}
