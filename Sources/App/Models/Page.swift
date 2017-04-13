import Vapor
import VaporPostgreSQL
import Fluent

class BlogPage {
    var title: String
    var content: String
    var id: Node?
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    required init(node: Node, in context: Context) throws {
        self.id = try node.extract("id")
        self.title = try node.extract("title")
        self.content = try node.extract("content")
    }
}

extension BlogPage: Model {
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
                "id": id,
                "title": title,
                "content": content
            ])
    }
}

extension BlogPage: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create("blogposts", closure: { (page) in
            page.id()
            page.string("title")
            page.string("content", length: 10000)
        })
    }
    
    static func revert(_ database: Database) throws {
        try database.delete("blogposts")
    }
}
