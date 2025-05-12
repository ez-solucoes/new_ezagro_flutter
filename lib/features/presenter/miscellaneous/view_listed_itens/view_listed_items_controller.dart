import 'package:mobx/mobx.dart';

part 'view_listed_items_controller.g.dart';

class ViewListedItemsController = ViewListedItemsControllerAbstract with _$ViewListedItemsController;

abstract class ViewListedItemsControllerAbstract with Store{

  @observable
  bool isLoading = false;

}