import UIKit

struct MockData {
    static let shared = MockData()
    
    private var sales: ListSection = {
        .sales([.init(title: "", image: "iphone14"),
                .init(title: "", image: "huawei"),
                .init(title: "", image: "samsung"),
                .init(title: "", image: "yandex")])
    }()
    
    private var categoty: ListSection = {
        .category([.init(title: "", image: "apple"),
                   .init(title: "", image: "xiaomi"),
                   .init(title: "", image: "used"),])
    }()
    
    private var example: ListSection = {
        .example([.init(title: "Смартфоны", image: "iphoneExmp"),
                  .init(title: "Ноутбуки", image: "laptopExmp"),
                  .init(title: "Умный дом", image: "HouseExmp"),
                  .init(title: "Игровые приставки", image: "consolesExmp"),
                  .init(title: "Аудиотехника", image: "audioExmp"),
                  .init(title: "Умные часы", image: "clockExmp"),
                  .init(title: "Детские товары", image: "childrenExmp"),
                  .init(title: "Фото и видео", image: "videoExmp"),
                  .init(title: "Проекторы", image: "projectorsExmp")])
    }()
    
    private var brand: ListSection = {
        .brand([.init(title: "", image: "yandexBrand"),
                .init(title: "", image: "appleBrand"),
                .init(title: "", image: "samsungBrand"),
                .init(title: "", image: "xiaomiBrand")])
    }()
    
    var pageData: [ListSection] {
        [sales, categoty, example, brand]
    }
}
