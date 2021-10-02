import 'package:flutter/widgets.dart';

abstract class HumbleWidget<T> extends StatelessWidget {
  const HumbleWidget(this.logic, [Key? key]) : super(key: key);

  final T logic;
}

abstract class HumbleStatefulWidget<T> extends StatefulWidget {
  const HumbleStatefulWidget(this.logic, [Key? key]) : super(key: key);
  final T logic;
}

abstract class HumbleState<T> extends State<HumbleStatefulWidget<T>> {
  T get logic => widget.logic;
}

abstract class HumbleTester {
  bool test();
}
