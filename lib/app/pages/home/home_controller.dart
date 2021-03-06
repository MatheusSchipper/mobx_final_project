import 'package:mobx/mobx.dart';
import 'package:mobx_final_project/app/models/item_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  @observable
  String filter = '';

  @observable
  ObservableList<ItemModel> itemList = [
    ItemModel(title: "Item 1", checked: true),
    ItemModel(title: "Item 2", checked: false),
    ItemModel(title: "Item 3", checked: false),
  ].asObservable();

  @computed
  int get totalChecked => listFiltered.where((element) => element.checked).length;

  @computed
  List<ItemModel> get listFiltered {
    if (filter.isEmpty)
      return itemList;
    else
      return itemList
          .where(
              (item) => item.title.toLowerCase().contains(filter.toLowerCase()))
          .toList();
  }

  @action
  addItem(ItemModel itemModel)
  {
    itemList.add(itemModel);
  }

  @action
  removeItem(ItemModel itemModel)
  {
    itemList.removeWhere((item) => item.title == itemModel.title);
  }

  @action
  setFilter(String value) => filter = value;
  
}