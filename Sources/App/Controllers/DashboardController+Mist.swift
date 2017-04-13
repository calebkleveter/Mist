import Vapor
import AdminPanel
import Routing
import HTTP
import VaporPostgreSQL
import Flash

class MistDashboardController {
    
    func createNewPage(_ request: Request)throws -> ResponseRepresentable {
        guard let pageName = request.data["page-name"]?.string,
            let pageContent = request.data["page-content"]?.string else {
                throw Abort.badRequest
        }
        
        var newPage = BlogPage(title: pageName, content: pageContent)
        do {
            try newPage.save()
        } catch let error {
            return Response(redirect: "/admin/dashboard/cnew-page").flash(.error, "An error occured while saving the page: \(error)")
        }
        
        return Response(redirect: "/admin/dashboard/cnew-page").flash(.success, "Page succesfully created!")
    }
}

extension MistDashboardController: AdminPanelController {
    func addRoutes(to group: RouteGroup<Droplet.Value, (RouteGroup<Droplet.Value, Droplet>)>) {
        group.post("new-page", handler: createNewPage)
    }
}
