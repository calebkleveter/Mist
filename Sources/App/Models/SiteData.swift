import Vapor
import VaporPostgreSQL
import Fluent

class SiteData {
    var id: Node?
    
    required init(node: Node, in context: Context) throws {
        id = try node.extract("id")
    }
}

extension SiteData: Model {
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
                "id": id
            ])
    }
}

extension SiteData: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create("sitedatas", closure: { (site) in
            site.id()
        })
    }
    
    static func revert(_ database: Database) throws {
        try database.delete("sitedatas")
    }
}
