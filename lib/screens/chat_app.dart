import 'package:chat_app/constants.dart';
import 'package:chat_app/model/message-model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/custom_chat_bubble.dart';

class ChatPage extends StatelessWidget {

   static String Id='ChatPage';
   final _controller =ScrollController();

   CollectionReference messages = FirebaseFirestore.instance.collection(messagesCollection);
   TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
   var email= ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt',descending: true).snapshots(),
      builder: (context,snapshot)
      {
        if(snapshot.hasData)
        {
          List<Message>message=[];
          for(int i=0;i<snapshot.data!.docs.length;i++)
          {
            message.add(Message.fromJsoon(snapshot.data!.docs[i]));
          }
         return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(kLogo,height: 50.0,),
                  const Text('Scholar chat',style: TextStyle(color: Colors.white),),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                    child: ListView.builder(

                      reverse: true,
                      controller: _controller,
                      itemCount: message.length,
                        itemBuilder: (context,index) {
                          return message[index].id==email? ChatBubble(
                          message: message[index],
                        ):ChatBubbleFreind(message: message[index]);
                        },
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data)
                    {
                      messages.add({
                        'message':data,
                        'createdAt':DateTime.now(),
                        'id':email
                      });
                      controller.clear();
                      _controller.animateTo(
                          0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn);
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      suffixIcon: const Icon(
                        Icons.send,
                        color: kPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: kPrimaryColor,
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }else
        {
          return const Scaffold(
            body: Center(child: Text('loading',style: TextStyle(fontSize: 50),)),
          );


        }
      },
    );
  }
}


