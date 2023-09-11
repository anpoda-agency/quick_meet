import 'package:flutter/material.dart';
import 'package:quick_meet/features/profile/profile_page/models/menu_item_model.dart';

class MenuItems {
  static const List<MenuItemModel> items = [
    itemEditPersonalData,
    itemChangePhoto,
    itemDeletePhoto,
  ];

  static const itemEditPersonalData = MenuItemModel(
    text: 'Редактировать',
    icon: Icons.edit_rounded,
  );

  static const itemChangePhoto = MenuItemModel(
    text: 'Загрузить фото',
    icon: Icons.upload_rounded,
  );

  static const itemDeletePhoto = MenuItemModel(
    text: 'Удалить фото',
    icon: Icons.delete_rounded,
  );
}
