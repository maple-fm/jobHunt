import Foundation

struct SessionModel: Entry {
    var name: String
    var deadline: Date?
    var location: String?
    var clothes: String?
    var item: String?
    var questions: String?
    var other: String?
    var category: EventName?
}
