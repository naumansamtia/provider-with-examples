import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/favorite-provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Screen'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: favoriteProvider.selectedItem.length,
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
