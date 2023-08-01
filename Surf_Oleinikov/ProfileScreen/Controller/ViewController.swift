//
//  ViewController.swift
//  Surf_Oleinikov
//
//  Created by Yaroslav on 01.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: Params
    
    private var isModify: Bool = false
    
    private var indexLastCell: Int {
        get {
            return (cells.count - 1) < 0 ? 0 : cells.count - 1
        }
    }
    
    private var cells: [String] = ["UIKit", "AutoLayout", "Storyboard", "XIB", "MVC", "SPM", "ARC", "CoreData", "Firebase", "URlSession", "GCD", "NSOperationQueue", "Core Animation", "AVAudioSession", "AVSpeechSynthesizer", "SFSpeechRecognizer", "in-app purchase", "GIT"]
    
    
    // MARK: Properties
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var profileView: ProfileView = {
        let profile = ProfileView(name: "Олейников Ярослав\nЮрьевич",
                                  info: "Junior iOS-разработчик, 1 год опыта",
                                  location: "Рязань")
        return profile
    }()
    
    private lazy var mySkillsLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои навыки"
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        label.textColor = Colors.shared.darkColor
        label.textAlignment = .left
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private lazy var collectionView: DynamicHeightCollectionView = {
        var collection = DynamicHeightCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.delaysContentTouches = false
        collection.register(SkillCell.self, forCellWithReuseIdentifier: SkillCell.reuseIdentifier)
        collection.isScrollEnabled = false
        return collection
    }()
    
    private lazy var layout: UICollectionViewCompositionalLayout = {
        return createLayout()
    }()
    
    private lazy var aboutHeader: UILabel = {
        let label = UILabel()
        label.text = "О себе"
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        label.textColor = Colors.shared.darkColor
        return label
    }()
    
    private lazy var aboutBody: UILabel = {
        let label = UILabel()
        label.text = "Изучал Swift по курсам CS193p, SwiftBook. Разрабатываю свое приложение в команде с UX/UI дизайнером.\nhttps://testflight.apple.com/join/mU7Hur0s"
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        label.textColor = Colors.shared.darkColor
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var editButton: EditButton = {
        let button = EditButton()
        button.addTarget(self, action: #selector(editCollection), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    // MARK: Setup
    
    private func setup() {
        setupScrollView()
        addProfileView()
        
        addMySkillsLabel()
        addEditButton()
        addCollectionView()
        addAboutHeader()
        addAboutBody()
    }
    
    
    // MARK: Add scroll view
    
    private func setupScrollView() {
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.insetsLayoutMarginsFromSafeArea = false
        scrollView.contentInsetAdjustmentBehavior = .never
        view.addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollView.delaysContentTouches = false
    }
    
    // MARK: Add profile view
    
    private func addProfileView() {
        profileView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileView)
        
        profileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        profileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        profileView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    }
    
    
    // MARK: Add my skill label
    
    private func addMySkillsLabel() {
        mySkillsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mySkillsLabel)
        
        mySkillsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0).isActive = true
        mySkillsLabel.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        mySkillsLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 20.0).isActive = true
    }
    
    
    // MARK: Add edit button
    
    private func addEditButton() {
        editButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(editButton)
        
        editButton.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0).isActive = true
        editButton.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 20.0).isActive = true
    }
    
    
    // MARK: Add collection view
    
    private func addCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
        
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4.0).isActive = true
        collectionView.topAnchor.constraint(equalTo: mySkillsLabel.bottomAnchor, constant: 16.0).isActive = true
        collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
    }
    
    
    // MARK: Add about header
    
    private func addAboutHeader() {
        aboutHeader.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aboutHeader)
        
        aboutHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0).isActive = true
        aboutHeader.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 24.0).isActive = true
        aboutHeader.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    }
    
    
    // MARK: Add about body
    
    private func addAboutBody() {
        aboutBody.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aboutBody)
        
        aboutBody.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0).isActive = true
        aboutBody.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0).isActive = true
        aboutBody.topAnchor.constraint(equalTo: aboutHeader.bottomAnchor, constant: 8.0).isActive = true
        aboutBody.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24.0).isActive = true
    }
    
    
    // MARK: Functions
    
    private func deleteCell(at indexPathItem: Int) {
        cells.remove(at: indexPathItem)
        collectionView.reloadData()
    }
    
    @objc private func editCollection() {
        editButton.isSelected = !editButton.isSelected
        isModify = editButton.isSelected
        add_removeLastCell()
        collectionView.reloadData()
    }
    
    private func add_removeLastCell() {
        if editButton.isSelected {
            cells.append("+")
        } else {
            guard !cells.isEmpty else { return }
            cells.removeLast()
        }
    }
    
    private func openAlert() {
        let alert = UIAlertController(title: "Добавление навыка", message: "Введите название навыка которым вы владеете", preferredStyle: .alert)
        alert.addTextField()
        
        let submitAction = UIAlertAction(title: "Добавить", style: .cancel) { [weak self] _ in
            guard let textField = alert.textFields?[0] else { return }
            guard let text = textField.text else { return }
            guard text.count > 0 else { return }
            self?.addCell(withText: text)
        }
        
        alert.addAction(submitAction)
        alert.addAction(UIAlertAction(title: "Отмена", style: .default))
        
        present(alert, animated: true)
    }
    
    private func addCell(withText text: String) {
        cells.insert(text, at: 0)
        collectionView.reloadData()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { section, env in
            let tagDefaultSize = CGSize(width: 50, height: 44)
            
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(tagDefaultSize.width), heightDimension: .absolute(tagDefaultSize.height))
            )
            
            item.edgeSpacing = NSCollectionLayoutEdgeSpacing(
                leading: .fixed(0),
                top: .fixed(0),
                trailing: .fixed(12),
                bottom: .fixed(12)
            )
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(tagDefaultSize.height + 12)),
                subitems: [item]
            )
            
            group.edgeSpacing = NSCollectionLayoutEdgeSpacing(
                leading: .fixed(0),
                top: .fixed(0),
                trailing: .fixed(0),
                bottom: .fixed(0)
            )
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 0,
                bottom: 0,
                trailing: 0
            )
            
            return section
        }
        
        return layout
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillCell.reuseIdentifier, for: indexPath) as? SkillCell else { return UICollectionViewCell() }
        cell.text = cells[indexPath.item]
        
        cell.state = isModify ? .delete : .normal
        cell.deleteClosure = { [weak self] in self?.deleteCell(at: indexPath.item) }
        
        if isModify {
            if indexPath.item == indexLastCell {
                cell.state = .normal
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard isModify else { return }
        guard indexPath.item == indexLastCell else { return }
        openAlert()
    }
    
}
