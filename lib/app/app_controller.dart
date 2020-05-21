import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'core/theme/theme.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  @observable
  ThemeData theme = ThemeApp.getTheme();
}
