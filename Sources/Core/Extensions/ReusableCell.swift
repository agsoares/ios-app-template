import UIKit

// MARK: - CellItem protocol

protocol CellItem {
    var identifier: String { get }
}

// MARK: - ReusableCell protocol

protocol ReusableCell {}

extension ReusableCell {
    static var identifier: String { String(describing: self) }
}

extension UITableViewCell: ReusableCell {}

extension UICollectionViewCell: ReusableCell {}

// MARK: - ConfigurableCell protocol

protocol ConfigurableCell: ReusableCell {
    func configure(withItem item: CellItem)
}

// MARK: - UITableView extension

extension UITableView {
    func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }

    func dequeueAndConfigure(
        withItem item: CellItem,
        forIndexPath indexPath: IndexPath
    ) -> UITableViewCell {
        guard
            let configurableCell = dequeueReusableCell(
                withIdentifier: item.identifier,
                for: indexPath
            ) as? ConfigurableCell
        else {
            fatalError("Could not dequeue cell \(item.identifier) at \(indexPath)")
        }
        configurableCell.configure(withItem: item)
        guard let cell = configurableCell as? UITableViewCell else {
            fatalError("Could not transform \(item.identifier) into UITableViewCell")
        }
        return cell
    }
}

// MARK: - UICollectionView extension

extension UICollectionView {
    func registerCell<Cell: UICollectionViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.identifier)
    }

    func dequeueAndConfigure(
        withItem item: CellItem,
        forIndexPath indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let configurableCell = dequeueReusableCell(
                withReuseIdentifier: item.identifier,
                for: indexPath
            ) as? ConfigurableCell
        else {
            fatalError("Could not dequeue cell \(item.identifier) at \(indexPath)")
        }
        configurableCell.configure(withItem: item)
        guard let cell = configurableCell as? UICollectionViewCell else {
            fatalError("Could not transform \(item.identifier) into UITableViewCell")
        }
        return cell
    }
}
