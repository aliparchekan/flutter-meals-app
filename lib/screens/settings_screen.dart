import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';
  final Function setFilters;
  final Map<String, bool> currentFilters;
  SettingsScreen(this.currentFilters, this.setFilters);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
  }

  Widget _buildSwitchTiles(
      String title, String subtitle, bool variable, Function updateVal) {
    return SwitchListTile(
      value: variable,
      onChanged: updateVal,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.setFilters(
                {
                  'gluten': _glutenFree,
                  'vegan': _vegan,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                },
              );
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTiles(
                  "Glutten-Free",
                  "Only include Gluten Free meals",
                  _glutenFree,
                  (val) {
                    setState(
                      () {
                        _glutenFree = val;
                      },
                    );
                  },
                ),
                _buildSwitchTiles(
                  "Vegetarian",
                  "Only include Vegetarian meals",
                  _vegetarian,
                  (val) {
                    setState(
                      () {
                        _vegetarian = val;
                      },
                    );
                  },
                ),
                _buildSwitchTiles(
                  "Vegan",
                  "Only include Vegan meals",
                  _vegan,
                  (val) {
                    setState(
                      () {
                        _vegan = val;
                      },
                    );
                  },
                ),
                _buildSwitchTiles(
                  "Lactose-Free",
                  "Only include Lactose Free meals",
                  _lactoseFree,
                  (val) {
                    setState(
                      () {
                        _lactoseFree = val;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
