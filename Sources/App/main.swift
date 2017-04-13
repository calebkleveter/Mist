import Vapor
import VaporPostgreSQL
import AdminPanel

AdminPanel.customController = MistDashboardController()

let drop = Droplet()

try drop.addProvider(VaporPostgreSQL.Provider.self)
try drop.addProvider(AdminPanel.Provider.self)

drop.preparations.append(BlogPage.self)

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.resource("posts", PostController())

drop.run()
