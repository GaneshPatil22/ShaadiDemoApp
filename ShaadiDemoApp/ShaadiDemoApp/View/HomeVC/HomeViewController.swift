//
//  HomeViewController.swift
//  ShaadiDemoApp
//
//  Created by MacMini 20 on 9/28/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK:- UI Elements
    private let userDataTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.tableFooterView = UIView()
        return tv
    }()
    private let refreshControl = UIRefreshControl()
    
    //MARK:- Variables
    //    var allUserData: [UserViewModel]?
    let dataSource = UserDataSource()
    
    lazy var viewModel : UserViewModel = {
        let viewModel = UserViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Home"
        setUpTableViewAndDelegates()
        self.viewModel.fetchAllUsers(){ [weak self] err in
            guard let _ = self else { return }
            if err != nil {
                AppUtil.showMessage(err!.localizedDescription, messageTitle: Messages.Error.rawValue, buttonTitle: Messages.Ok.rawValue)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpView()
        userDataTableView.reloadData()
    }
    
    private func setUpView() {
        //MARK:- Added view to main View
        view.addSubview(userDataTableView)
        
        //MARK:- SetUp UIConstraints
        userDataTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userDataTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        userDataTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        userDataTableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    private func setUpTableViewAndDelegates() {
        userDataTableView.dataSource = dataSource
        userDataTableView.delegate = self
        
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            DispatchQueue.main.async {
                self?.userDataTableView.reloadData()
            }
        }
        
        userDataTableView.register(UserInfoTableViewCell.self, forCellReuseIdentifier: CellIdentifier.UserInfoTableViewCell.rawValue)
        
        userDataTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshUserData(_:)), for: .valueChanged)
    }
    
    @objc private func refreshUserData(_ sender: Any) {
        self.viewModel.fetchAllUsers(){ [weak self] err in
            guard let _ = self else { return }
            DispatchQueue.main.async {
                if err != nil {
                    AppUtil.showMessage(err!.localizedDescription, messageTitle: Messages.Error.rawValue, buttonTitle: Messages.Ok.rawValue)
                }
                self?.refreshControl.endRefreshing()
            }
        }
    }
    
    private func updateUserTableView() {
        userDataTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.dataSource.data.value[indexPath.row]
        let userDetailVC = UserDetailViewController(model: model)
        userDetailVC.didTapOnFavoriteButton = updateUserTableView
        userDetailVC.delegate = self
        navigationController?.pushViewController(userDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
    }
}

extension HomeViewController: UpdateHomeViewControllerDelegate {
    func updateSingleCellWhichHasBeenUpdate() {
        userDataTableView.reloadData()
    }
}
