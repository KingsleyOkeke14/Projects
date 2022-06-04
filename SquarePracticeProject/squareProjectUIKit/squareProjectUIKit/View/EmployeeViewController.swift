//
//  ViewController.swift
//  squareProjectUIKit
//
//  Created by Kingsley Okeke on 2021-07-24.
//

import UIKit
import SwiftUI
//import SDWebImage
import Combine

class EmployeeViewController: UIViewController {

    let indicatorView = LoadingIndicatorView()
    private var cancellables = [AnyCancellable]()
    var tableView = UITableView()
    
    var employees = [Employee]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    let viewModel: EmployeeVM
    
    //MARK: - View
    
    lazy var emptyEmployeeListView: UIView = {
        let eelv = UILabel()
        eelv.text = "The Employee Directory is empty or cannot be fetched at this time"
        eelv.font = .systemFont(ofSize: 24, weight: .bold)
        eelv.textColor = .gray
        eelv.numberOfLines = 0
        eelv.textAlignment = .center
        return eelv
    }()
    
    lazy var errorView: UILabel = {
        let ev = UILabel()
        ev.font = .systemFont(ofSize: 24, weight: .bold)
        ev.textColor = .red.withAlphaComponent(0.4)
        ev.numberOfLines = 0
        ev.textAlignment = .center
        return ev
    }()
    
    init(viewModel: EmployeeVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
                        let coloredAppearance = UINavigationBarAppearance()
                        coloredAppearance.configureWithOpaqueBackground()
                        coloredAppearance.backgroundColor = .black
                        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
                        UINavigationBar.appearance().standardAppearance = coloredAppearance
                        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
        navigationController?.navigationBar.standardAppearance = coloredAppearance

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Employees Directory"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 20) ]
        configureViewAndConstraints()
        registerPublishedProperty()
    
    }
    
    //MARK: - Helpers
    func configureViewAndConstraints() {
        
        view.addSubview(tableView)
        //Set Delegates
        setEmployeesTableDelegates()
        //Set Table Height
        tableView.rowHeight = 70
        tableView.separatorStyle = .none
        tableView.selectionFollowsFocus = false

        tableView.backgroundColor = .black
        //Register Cells
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifier)
        //Set Table Constraints
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }

    func setEmployeesTableDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    //MARK: - Set State
    
    func setViewState(state: ViewState) {
        
        switch state {
        case .loading:
            createLoadingIndicatorView()
        case .complete:
             removeLoadingIndicatorView()
            self.employees = viewModel.employees
        case .empty:
            setEmptyEmployeeListScreen()
        case .error(let error):
            removeLoadingIndicatorView()
            setErrorScreen(errorMessage: error)
        }
        
    }
    
    //MARK: = Register Published Property
    
    func registerPublishedProperty() {
        viewModel.$state.sink { [weak self]  in
            self?.setViewState(state: $0)
        }.store(in: &cancellables)
        
    }
    
    func createLoadingIndicatorView() {
        view.addSubview(indicatorView)
        indicatorView.centerY(inView: view)
        indicatorView.center(inView: view)
    }
    
    func removeLoadingIndicatorView() {
        indicatorView.stopAnimation()
    }
    
    func setEmptyEmployeeListScreen() {
        tableView.backgroundView = emptyEmployeeListView
        emptyEmployeeListView.centerY(inView: tableView)
        emptyEmployeeListView.setDimensions(width: view.bounds.width, height: 200)

    }
    
    func setErrorScreen(errorMessage: String?) {
        errorView.text = errorMessage ?? "A HTTP Error Occured while fetching the Employee Data"
        tableView.backgroundView = errorView
        errorView.centerY(inView: tableView)
        errorView.setDimensions(width: view.bounds.width, height: 200)

    }
    
}

extension EmployeeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier) as! EmployeeTableViewCell
        cell.selectionStyle = .none
        cell.employee = employees[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEmployee = employees[indexPath.row]
        
        let viewController = EmployeeDetailViewController()
        viewController.employee = selectedEmployee
        
        self.present(viewController, animated: true)
    }
}

#if DEBUG
struct PreviewViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            EmployeeViewController(viewModel: EmployeeVM())
        }
    }
}
#endif
