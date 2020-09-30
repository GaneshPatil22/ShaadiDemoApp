//
//  ShaadiDemoAppTests.swift
//  ShaadiDemoAppTests
//
//  Created by MacMini 20 on 9/28/20.
//

import XCTest
@testable import ShaadiDemoApp

class ShaadiDemoAppTests: XCTestCase {

    var userDetailModel: UserDetailViewModel!

    override func setUpWithError() throws {
        userDetailModel = UserDetailViewModel(model: UserDataModel(id: 1, name: "User 1", username: "UserName 1", email: "Email 1", address: Address(street: "Street 1", suite: "Suite 1", city: "City 1", zipcode: "Zip 1", geo: Geo(lat: "Lat 1", lng: "Lng 1")), phone: "Phone 1", website: "Website 1", company: Company(name: "CName 1", catchPhrase: "Catch 1", bs: "BS 1")))
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        userDetailModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVerifyCompanyName() {
        XCTAssertEqual("CName 1", userDetailModel?.companyName)
    }

    func testVerifyUserFullAddress() {
        let address = "\(userDetailModel.userData.address.street), \(userDetailModel.userData.address.suite) \n\(userDetailModel.userData.address.city), \(userDetailModel.userData.address.zipcode)"
        XCTAssertEqual(address, userDetailModel.userFullAddress)
    }

    func testCompanyDescription() {
        let companyDescription = "\(userDetailModel.userData.company.name)\n\(userDetailModel.userData.company.catchPhrase)\n\(userDetailModel.userData.company.bs)"
        XCTAssertEqual(companyDescription, userDetailModel.compnayAddress)
    }

    func testVerifyUpdateUserFavoriteAction() {
        userDetailModel.updateUserFavoriteStatus()
        XCTAssertTrue(userDetailModel.isUserMarkedAsFavorite, "User is Not marked as favorite")
        userDetailModel.updateUserFavoriteStatus()
        XCTAssertFalse(userDetailModel.isUserMarkedAsFavorite, "User is Not marked as not favorite")
    }

}
