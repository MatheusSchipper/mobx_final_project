import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_final_project/app/models/item_model.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel item;

  final Function removeClicked;

  const ItemWidget({Key key, this.item, this.removeClicked}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          title: Text(item.title),
          leading: Checkbox(
            value: item.checked,
            onChanged: item.setChecked,
          ),
          trailing: IconButton(
            color: Colors.red,
            icon: Icon(Icons.remove_circle),
            onPressed: removeClicked,
          ),
        );
      },
    );
  }
}
