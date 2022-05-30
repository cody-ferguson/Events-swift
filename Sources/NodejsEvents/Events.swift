private typealias function = (Any) -> Void
private struct Event {
    var name: String
    var function: function?
}
extension Event {
  static func == (left: Event, right: String) -> Bool {
    return left.name == right
  }
}

open class EventEmitter {
    private var events: [Event] = []
    init(_ Initialevents: [String]){
        for event in Initialevents {
            events.append(Event(name: event))
        }
    }
    public func emit(_ event: String,_ args: Any = ""){
        for currentEvent in events {
            if currentEvent == event {
                currentEvent.function(args)
            }
        }
    }
    public func on(_ eventName: String, _ callback: @escaping function){
        for i in 0...events.count-1 {
            let event = events[i]
            if event == eventName {
                events[i] = Event(name: eventName, function: callback)
            }
        }
    }
}
