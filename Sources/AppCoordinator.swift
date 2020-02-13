import UIKit

// MARK: - Class

final class AppCoordinator: Coordinator {
    // MARK: Internal variables

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    // MARK: Initializers

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: Internal methods

    func start() {
        let vc = ViewController()
        navigationController.pushViewController(vc, animated: false)
    }
}
