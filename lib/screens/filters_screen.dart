import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const route = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: this._glutenFree,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust you meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                this._buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals.',
                    this._glutenFree, (newValue) {
                  setState(() {
                    this._glutenFree = newValue;
                  });
                }),
                this._buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    this._lactoseFree, (newValue) {
                  setState(() {
                    this._lactoseFree = newValue;
                  });
                }),
                this._buildSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian meals.',
                    this._vegetarian, (newValue) {
                  setState(() {
                    this._vegetarian = newValue;
                  });
                }),
                this._buildSwitchListTile(
                    'Vegan',
                    'Only include vegan meals.',
                    this._vegan, (newValue) {
                  setState(() {
                    this._vegan= newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
