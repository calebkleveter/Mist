import Vapor
import VaporPostgreSQL

class BlogPage {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
