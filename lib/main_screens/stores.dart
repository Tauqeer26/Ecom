import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app/main_screens/visit_store.dart';
import 'package:multi_store_app/widgets/appbar_widgets.dart';



class StoresScreen extends StatelessWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppbarTitle(
          title: 'Stores',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream:FirebaseFirestore.instance.collection('suppliers').snapshots() ,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot)
          {
            if (snapshot.hasData){
              return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 25,
                  crossAxisCount: 2), 
                
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (() {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context)=> VisitStore(suppId: snapshot.data!.docs[index]['sid'])));
                  }),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                         SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset('images/inapp/store.jpg'),
                        ),
                        ],
                      ),
                      Text(snapshot.data!.docs[index]['storename'].toUpperCase())
                    ],
                  ),
                );
              
              }

              );
              
            }
            return const Center(
              child: Text('No data'),
            );

          },),
      ),
    );
  }
}
