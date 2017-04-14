import Vapor
import VaporPostgreSQL
import Fluent

class SiteData {
    var id: Node?
    var theme: String
    
    init(theme: String) {
        self.theme = theme
    }
    
    required init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        theme = try node.extract("theme")
    }
}

extension SiteData: Model {
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
                "id": id,
                "theme": theme
            ])
    }
}

extension SiteData: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create("sitedatas", closure: { (site) in
            site.id()
            site.string("theme")
        })
    }
    
    static func revert(_ database: Database) throws {
        try database.delete("sitedatas")
    }
}
