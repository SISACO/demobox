import 'package:flutter/material.dart';

reDetails (Image img,Text titletxt,String t1,Text des){
  return Container(
          padding: const EdgeInsets.all(20),
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(15),child:img,),
              const SizedBox(height: 20,),
              titletxt,
              const SizedBox(height: 20,),
              Text(t1),
              const SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 85,
                decoration: BoxDecoration(color: Color.fromARGB(255, 140, 143, 150),borderRadius: BorderRadius.circular(20)),
                child: Container(
                  margin:const EdgeInsets.only(left: 10,top: 5,bottom: 5),
                  child: const Row(
                  children: [
                    CircleAvatar(child: CircleAvatar(backgroundImage: AssetImage('assests/details.jpg')),),

                  ],
                ),
                )
              )
            ],
            
          ),
  );
}