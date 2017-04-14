import Vapor
import VaporPostgreSQL
import Fluent

class SiteData {
    var id: Node?
    var theme: String
    var name: String
    var subscribers: Int?
    
    init(theme: String, name: String) {
        self.theme = theme
        self.name = name
    }
    
    required init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        theme = try node.extract("theme")
        name = try node.extract("name")
        subscribers = try node.extract("subscribers")
    }
}

extension SiteData: Model {
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
                "id": id,
                "theme": theme,
                "name": name,
                "subscribers": subscribers
            ])
    }
}

extension SiteData: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create("sitedatas", closure: { (site) in
            site.id()
            site.string("theme")
            site.string("name")
            site.int("subscribers", optional: true)
        })
    }
    
    static func revert(_ database: Database) throws {
        try database.delete("sitedatas")
    }
}
