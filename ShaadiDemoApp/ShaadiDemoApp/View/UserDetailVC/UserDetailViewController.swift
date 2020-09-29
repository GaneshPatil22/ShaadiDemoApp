//
//  UserDetailViewController.swift
//  ShaadiDemoApp
//
//  Created by MacMini 20 on 9/29/20.
//

import UIKit

protocol UpdateHomeViewControllerDelegate {
    func updateSingleCellWhichHasBeenUpdate()
}
/*
Name
Username
Address details
Company Detail
Phone & Website
Star (a call to action OR a button where it can be marked as Favourite)

Street Number Street Name, Suite Number
City Name, State Zip code*/

class UserDetailViewController: UIViewController {
    
    let favoriteButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(favoriteBtnAction), for: .touchUpInside)
        btn.setTitle("Favorite normal", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .gray
        return btn
    }()
    
    let favoriteDelegateButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(favoriteDelegateBtnAction), for: .touchUpInside)
        btn.setTitle("Favorite delegate", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .gray
        return btn
    }()
    
    let favoriteClouserButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(favoriteClouserBtnAction), for: .touchUpInside)
        btn.setTitle("Favorite clouser", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .gray
        return btn
    }()

    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK:- Labels
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Name"
        return lbl
    }()

    let userNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "User name"
        return lbl
    }()

    let addressLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Address"
        return lbl
    }()

    let companyLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Company"
        return lbl
    }()

    let phoneLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Phone"
        return lbl
    }()

    let websiteLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Website"
        return lbl
    }()

    //MARK:- User Data Label
    let nameDataLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    let userNameDataLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    let addressDataLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        return lbl
    }()

    let companyDataLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 4
        return lbl
    }()

    let phoneDataLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    let websiteDataLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var userDetailViewModel: UserDetailViewModel
    var delegate: UpdateHomeViewControllerDelegate?
    var didTapOnFavoriteButton: (() -> ())?
    
    init(model: UserDetailViewModel) {
        self.userDetailViewModel = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isTranslucent = false

        title = userDetailViewModel.userData.name
        view.backgroundColor = .white
        setUpView()
        setUpData()
    }

    private func setUpView() {

        //MARK:- Background
        view.backgroundColor = userDetailViewModel.isUserMarkedAsFavorite ? UIColor.yellow : UIColor.lightGray
        
        //MARK:- Add UIElement to View
        self.view.addSubview(favoriteButton)
        self.view.addSubview(favoriteDelegateButton)
        self.view.addSubview(favoriteClouserButton)
        self.view.addSubview(containerView)

        containerView.addSubview(nameLabel)
        containerView.addSubview(userNameLabel)
        containerView.addSubview(websiteLabel)
        containerView.addSubview(addressLabel)
        containerView.addSubview(phoneLabel)
        containerView.addSubview(companyLabel)

        containerView.addSubview(nameDataLabel)
        containerView.addSubview(userNameDataLabel)
        containerView.addSubview(websiteDataLabel)
        containerView.addSubview(addressDataLabel)
        containerView.addSubview(phoneDataLabel)
        containerView.addSubview(companyDataLabel)

        //MARK:- Add Constraints

        view.addConstraintsWithFormat(format: "V:|-10-[v0]-10-[v1(30)]-10-[v2(30)]-10-|", view: containerView, favoriteDelegateButton, favoriteButton)
        view.addConstraintsWithFormat(format: "V:|-10-[v0]-10-[v1(30)]-10-[v2(30)]-10-|", view: containerView, favoriteClouserButton, favoriteButton)
        view.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", view: containerView)
        view.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", view: favoriteButton)
        view.addConstraintsWithFormat(format: "H:|-10-[v0]-10-[v1(==v0)]-10-|", view: favoriteDelegateButton, favoriteClouserButton)

        view.addConstraintsWithFormat(format: "V:|-5-[v0(20)]-5-[v1(20)]-5-[v2(20)]-30-[v3(20)]-70-[v4(20)]-5-[v5(20)]",
                                      view: nameLabel, userNameLabel, addressLabel, companyLabel, phoneLabel, websiteLabel)

        view.addConstraintsWithFormat(format: "V:|-5-[v0(20)]-5-[v1(20)]-5-[v2(45)]-5-[v3(85)]-5-[v4(20)]-5-[v5(20)]",
                                      view: nameDataLabel, userNameDataLabel, addressDataLabel, companyDataLabel, phoneDataLabel, websiteDataLabel)

        view.addConstraintsWithFormat(format: "H:|-5-[v0(100)]-5-[v1]-5-|", view: nameLabel, nameDataLabel)
        view.addConstraintsWithFormat(format: "H:|-5-[v0(100)]-5-[v1]-5-|", view: userNameLabel, userNameDataLabel)
        view.addConstraintsWithFormat(format: "H:|-5-[v0(100)]-5-[v1]-5-|", view: companyLabel, companyDataLabel)
        view.addConstraintsWithFormat(format: "H:|-5-[v0(100)]-5-[v1]-5-|", view: addressLabel, addressDataLabel)
        view.addConstraintsWithFormat(format: "H:|-5-[v0(100)]-5-[v1]-5-|", view: phoneLabel, phoneDataLabel)
        view.addConstraintsWithFormat(format: "H:|-5-[v0(100)]-5-[v1]-5-|", view: websiteLabel, websiteDataLabel)
    }

    private func setUpData() {
        nameDataLabel.text = userDetailViewModel.userData.name
        userNameDataLabel.text = userDetailViewModel.userData.username
        phoneDataLabel.text = userDetailViewModel.userData.phone
        websiteDataLabel.text = userDetailViewModel.userData.website
        companyDataLabel.text = userDetailViewModel.compnayAddress
        addressDataLabel.text = userDetailViewModel.userFullAddress
    }

    //MARK:- Simple Approach
    //Details:- As our userViewModel is class and classes are reference type so updating favorite value here will also effect the value present on HomeViewController. So view will appear simply call reloadData.
    // See below i have also implemented the clouser as well as delegation to update the favorite value

    @objc private func favoriteBtnAction() {
        showMessageAndRedirectToPreviousVC()
    }

    //MARK:- Delegation method
    @objc private func favoriteDelegateBtnAction() {
        delegate?.updateSingleCellWhichHasBeenUpdate()
        showMessageAndRedirectToPreviousVC()
    }

    //MARK:- Clouser
    @objc private func favoriteClouserBtnAction() {
        didTapOnFavoriteButton?()
        showMessageAndRedirectToPreviousVC()
    }

    private func showMessageAndRedirectToPreviousVC() {
        let message = userDetailViewModel.updateUserFavoriteStatus()
        AppUtil.showMessage(message, messageTitle: Messages.Success.rawValue, buttonTitle: Messages.Ok.rawValue) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
