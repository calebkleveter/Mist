import Vapor
import Fluent
import Foundation

final class Post: Model {
    var id: Node?
    var content: String
    var name: String
    
    init(content: String, name: String) {
        self.content = content
        self.name = name
    }

    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        content = try node.extract("content")
        name = try node.extract("name")
    }

    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "content": content,
            "name": name
        ])
    }
}

extension Post: Preparation {
    static func prepare(_ database: Database) throws {
        //
    }

    static func revert(_ database: Database) throws {
        //
    }
}
