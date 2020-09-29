//
//  UserInfoTableViewCell.swift
//  ShaadiDemoApp
//
//  Created by MacMini 20 on 9/28/20.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {

    //MARK: UIElements
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let userNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
    }()

    private let userPhoneNumberLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12)
        return lbl
    }()

    private let userWebsiteLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12)
        return lbl
    }()

    private let companyNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12)
        return lbl
    }()

    private let starView: StarView = {
        let view = StarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpView() {

        //MARK:- Added view to main View
        addSubview(containerView)
        containerView.addSubview(userNameLabel)
        containerView.addSubview(userPhoneNumberLabel)
        containerView.addSubview(userWebsiteLabel)
        containerView.addSubview(companyNameLabel)
        containerView.addSubview(starView)

        //MARK:- SetUp UIConstraints
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true

        userNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        userPhoneNumberLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor).isActive = true
        userPhoneNumberLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        userPhoneNumberLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        userPhoneNumberLabel.widthAnchor.constraint(equalTo: userNameLabel.widthAnchor).isActive = true

        userWebsiteLabel.topAnchor.constraint(equalTo: userPhoneNumberLabel.bottomAnchor).isActive = true
        userWebsiteLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        userWebsiteLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        userWebsiteLabel.widthAnchor.constraint(equalTo: userNameLabel.widthAnchor).isActive = true

        companyNameLabel.topAnchor.constraint(equalTo: userWebsiteLabel.bottomAnchor).isActive = true
        companyNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        companyNameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        companyNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        companyNameLabel.widthAnchor.constraint(equalTo: userNameLabel.widthAnchor).isActive = true

        starView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        starView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        starView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        starView.heightAnchor.constraint(equalToConstant: 30).isActive = true

        userNameLabel.trailingAnchor.constraint(equalTo: starView.leadingAnchor, constant: -10).isActive = true

    }

    func setUpData(viewModel: UserDetailViewModel) {
        userNameLabel.text = viewModel.userData.name
        userPhoneNumberLabel.text = viewModel.userData.phone
        userWebsiteLabel.text = viewModel.userData.website
        companyNameLabel.text = viewModel.companyName
        let color = viewModel.isUserMarkedAsFavorite ? UIColor.yellow : UIColor.lightGray
        starView.setColor(color: color)
    }
}
