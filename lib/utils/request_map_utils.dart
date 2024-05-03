

class RequestMapUtils{
  RequestMapUtils._();
  static final intence = RequestMapUtils._();

  Map<dynamic, dynamic>  makePostRequestDashboard(restaurantId){
    Map map  = Map<dynamic, dynamic>();
    map["RestaurantId"] = restaurantId;
    return map;
  }

}