import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/models/recipe_model.dart';
import 'package:flutter_recipe_app/theme/application_theme.dart';

class SliderWidget extends StatefulWidget {
  final String recipeName;
  final String calVal;
  final String recipe;
  final List<Ig> ingredientsMapList;

  SliderWidget({
    @required this.calVal,
    @required this.recipe,
    @required this.recipeName,
    @required this.ingredientsMapList,
  });
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          _vSpacer,
          _recipeName,
          _vSpacer,
          _calorieValues,
          _vSpacer,
          _recipe,
          _vSpacer,
          _ingredientsSlider,
        ],
      ),
    );
  }

  Widget get _recipe => Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.recipe,
            style: ApplicationTheme.blackText,
            textAlign: TextAlign.center,
          ),
        ),
      );

  Widget get _recipeName => Container(
        child: Text(
          widget.recipeName,
          style: ApplicationTheme.titleText,
        ),
      );

  Widget get _calorieValues => Container(
        child: Text(
          widget.calVal,
          style: ApplicationTheme.redText,
        ),
      );

  Widget get _ingredientsSlider => Container(
        child: Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.ingredientsMapList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    children: [
                      Image.asset(
                        widget.ingredientsMapList.elementAt(index).p,
                        height: 42,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '''${widget.ingredientsMapList.elementAt(index).n}
${widget.ingredientsMapList.elementAt(index).c}''',
                        style: ApplicationTheme.simpleText,
                      )
                    ],
                  ),
                );
              }),
        ),
      );

  Widget get _vSpacer => SizedBox(
        height: 8,
      );
}
