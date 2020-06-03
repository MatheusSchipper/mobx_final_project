import 'package:mobx/mobx.dart';
import 'package:mobx_final_project/app/models/item_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<ItemModel> itemList = [
    ItemModel(title: "Item 1", checked: true),
    ItemModel(title: "Item 2", checked: false),
    ItemModel(title: "Item 3", checked: false),
  ].asObservable();

  // final itemList = BehaviorSubject<List<ItemModel>>.seeded([]);
  // final filter = BehaviorSubject<String>.seeded("");

  // setFilter(String value) => filter.add(value);

  // addItem(ItemModel model)
  // {
  //   var list = itemList.value;
  //   list.add(model);
  //   itemList.add(list);
  // }

  // removeItem(ItemModel mode)
  // {

  // }

  @observable
  String filter = '';

  @computed
  int get totalChecked =>
      listFiltered.where((element) => element.checked).length;

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
  addItem(ItemModel itemModel) {
    itemList.add(itemModel);
  }

  @action
  removeItem(ItemModel model) {
    itemList.removeWhere((item) => item.title == model.title);
  }

  @action
  setFilter(String value) => filter = value;
}
