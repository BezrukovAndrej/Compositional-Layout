import UIKit

enum ListSection {
    case sales([ListItem])
    case category([ListItem])
    case example([ListItem])
    case brand([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .sales(let items),
                .category(let items),
                .example(let items),
                .brand(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .sales(_):
            return "Акции"
        case .category(_):
            return "Категории"
        case .example(_):
            return "Каталог"
        case .brand(_):
            return "Бренды"
        }
    }
}
