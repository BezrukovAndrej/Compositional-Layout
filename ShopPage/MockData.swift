import UIKit

struct MockData {
    
    static let shared = MockData()
    
    private let sales: ListSection = {
        .sales([.init(title: "", image: "watch"),
                .init(title: "", image: "apple"),
                .init(title: "", image: "poco")])
    }()
    
    private let category: ListSection = {
        .category([.init(title: "Акции", image: "promo"),
                   .init(title: "Смартфоны", image: "iphone"),
                   .init(title: "Ноутбуки", image: "laptop"),
                   .init(title: "Аудиотехника", image: "audio"),
                   .init(title: "Умный дом", image: "house"),
                   .init(title: "Приставки", image: "console"),
                   .init(title: "Умные часы", image: "watch2"),
                   .init(title: "Проекторы", image: "projectors"),
                   .init(title: "Фото и видео", image: "photo")])
    }()
    
    private let novelties: ListSection = {
        .novelties([.init(title: "", image: "promo1"),
                    .init(title: "", image: "promo2"),
                    .init(title: "", image: "promo3")])
    }()
    
    var pageData:[ListSection] {
        [sales, category, novelties]
    }
}
