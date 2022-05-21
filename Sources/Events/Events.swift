typealias function = (Any) -> Void
struct Event {
  var name: String
  var function: function
  var once: Bool
}
extension Event {
  static func == (left: Event, right: String) -> Bool {
    return left.name == right
  }
}

public class EventEmitter {
  private var events: [Event] = []
  init(){}
  func emit(_ event: String,_ args: Any = ""){
    for currentEvent in events {
      if currentEvent == event {
        currentEvent.function(args)
      }
    }
  }
  func on(_ event: String, _ callback: @escaping function){
    events.append(Event(name: event, function: callback, once: false))
  }
}
