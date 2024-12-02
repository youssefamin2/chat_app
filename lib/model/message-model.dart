class Message
{
  final String message;
  final String id;
  Message(this.message,this.id);
  factory Message.fromJsoon( jsonData)
  {
    return Message(jsonData['message'],jsonData['id']);
  }
}