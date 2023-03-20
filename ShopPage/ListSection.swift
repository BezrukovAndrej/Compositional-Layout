import UIKit

enum ListSection {
    case sales([ListItem])
    case category([ListItem])
    case novelties([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .sales(let items),
                .category(let items),
                .novelties(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .sales(_):
            return ""
        case .category(_):
            return "Категории"
        case .novelties(_):
            return "Новинки"
        }
    }
}
