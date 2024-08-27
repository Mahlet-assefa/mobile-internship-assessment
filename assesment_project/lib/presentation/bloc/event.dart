class GroceryEvent {
  GroceryEvent();
}


class GetAllGroceryEvent extends GroceryEvent{}

// GetSingleProductEvent
class GetGroceryEvent extends GroceryEvent{
  final String groceryId;

  GetGroceryEvent({required this.groceryId});
}
