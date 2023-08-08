//
//  LoginViewController.swift
//  Teleprompt
//
//  Created by Javier Lumbi on 27/7/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    private var viewModel: LoginViewModelProtocol
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Int, PeopleGroup>!
    private var numberOfGroups: Int?
    private var registerButton: UIButton = {
        let button = UIButton()
        button.borderWidth = 1
        button.cornerRadius = 10
        button.borderColor = .gray
        button.setTitle("Whats App", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        
        return button
    }()
    
    weak var delegate: Coordinator?
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureDataSource()
        applySnapshot()
    }
    
    private func calculateGroups() -> [PeopleGroup] {
        numberOfGroups = Int((collectionView.bounds.height / calculateItemSize().height).rounded(.up))
        var groups = [PeopleGroup]()
        for _ in 0..<(numberOfGroups ?? 5) {
            groups.append(PeopleGroup(id: UUID()))
        }
        
        return groups
    }
    
    private func calculateItemSize() -> CGSize {
        CGSize(width: view.bounds.width * 1.31, height: view.frame.height * 0.15)
    }
    
    private func setupViews() {
        
        navigationController?.navigationBar.isHidden = true
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 6.7
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = calculateItemSize()
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, PeopleGroup>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PersonCollectionViewCell
            if ((self.numberOfGroups ?? 5) / 2) == indexPath.row {
                cell.configure(with: item) { self.registerButton }
            } else {
                cell.configure(with: item)
            }
            return cell
        }
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, PeopleGroup>()
        snapshot.appendSections([0])
        snapshot.appendItems(calculateGroups())
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

struct PeopleGroup: Hashable {
    let id: UUID
    
    public func getPeopleGroup() -> [Person] {
        var group = [Person]()
        for _ in 0..<4 {
            group.append(Person.allCases.randomElement() ?? Person.Person1)
        }
        return group
    }
}

enum Person: Int, CaseIterable {
    
    case Person1 = 1
    case Person2 = 2
    case Person3 = 3
    case Person4 = 4
    case Person5 = 5
    case Person6 = 6
    case Person7 = 7
    case Person8 = 8
    case Person9 = 9
    case Person10 = 10
    case Person11 = 11
    case Person12 = 12
    
    var imageName: String {
        return "Person-\(self.rawValue)"
    }
}
