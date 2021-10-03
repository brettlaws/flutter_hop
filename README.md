A simple library for applying the Humble Object Pattern in order to create clean, testable widgets.  


## Features


This package might be helpful to you if:
- a high level of test coverage is required
- you apply test driven development to app development
- you find it difficult to separate UI logic from appearance
- the widgets you create depend on too many details



## Usage


Using the library will feel very familiar.  Let's start by creating a simple button as a <b>HumbleStatelessWidget</b>.

1) Write a test! (skip ahead if you still haven't been converted to TDD 😜).  Be sure to include tests for all logic that is important to you.  This may include strings, colors, padding -- anything that is necessary to make the widget "right".
```dart
bool testSimpleButtonLogic(){
	bool tapped = false;
	final logic = SimpleButtonLogic(text: 'test', onTap: () {
		tapped = true;
	});
	if (logic.text != 'test') return false;
	logic.onTap();
	if (tapped == false) return false;
	return true;
}
```
2) Create a plain old Dart object to represent the UI element's logic.  
```dart
class SimpleButtonLogic {
	SimpleButtonLogic({required this.text, required this.onTap});

	final String text;
	final Function() onTap;
}
```
3) Once your class passes it's tests, you will use it to create your widget.  Use the <b>logic</b> getter to access your widget's logic.
```dart
class SimpleButton extends HumbleStatelessWidget<SimpleButtonLogic> {
	SimpleButton(SimpleButtonLogic logic) : super(logic, key: Key('SimpleButton'));

	@override
	Widget build(BuildContext context) {
		return ElevatedButton(
			child: Text(logic.text),
			onPressed: () => logic.onTap(),
		);
	}
}
```
That's it!  You now have a testable (albeit simple) widget!  Take a look at the <b>example</b> folder for creating a <b>HumbleStatefulWidget</b>.


## Additional information


The amount of source code in the library is minuscule, and it doesn't constitute anything new or bleeding-edge.  However, use of this library will help the average developer apply high level and highly-esteemed software engineering principles to their code.  

Learn more about the Humble Object Pattern here: https://martinfowler.com/bliki/HumbleObject.html.

Contribute at https://github.com/brettlaws/flutter_hop.