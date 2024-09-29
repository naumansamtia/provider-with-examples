import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_state_manage1/Provider/favorite-provider.dart';

import 'favorited-list.dart';

class FavoriteScreenList extends StatefulWidget {
  const FavoriteScreenList({super.key});

  @override
  State<FavoriteScreenList> createState() => _FavoriteScreenListState();
}

class _FavoriteScreenListState extends State<FavoriteScreenList> {
  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Screen'),
        backgroundColor: Colors.blueAccent,
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoriteScreen()));
            },
              child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 20,
                itemBuilder: (context, index){
              return Consumer<FavoriteProvider>(builder:(context, value, child) {
                return ListTile(
                  onTap: (){
                    if(value.selectedItem.contains(index)){
                      value.removeSelectedItem(index);
                    }else{
                      value.addSelectedItem(index);
                    }
                    // setState(() {
                    //
                    // });
                    print(value.selectedItem);
                  },
                  title: Text('Item $index'),
                  trailing: value.selectedItem.contains(index) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
                );
              });
            }),
          )
        ],
      ),
    );
  }
}
