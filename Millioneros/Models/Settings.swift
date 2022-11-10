import Foundation

class Settings: Codable {
    
    var name: String
    var recordsArray: [Int]
    
    init(name: String, recordsArray: [Int]) {
        self.name = name
        self.recordsArray = recordsArray
    }
    
    enum CodingKeys: String, CodingKey {
        case name, recordsArray
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.recordsArray = try container.decode([Int].self, forKey: .recordsArray)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.name, forKey: .name)
        try container.encode(self.recordsArray, forKey: .recordsArray)
    }
    
    
    
}
