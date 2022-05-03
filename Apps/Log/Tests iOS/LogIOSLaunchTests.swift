<<<<<<< HEAD:Apps/Log/Tests iOS/LogIOSLaunchTests.swift
//
//  LogIOSLaunchTests.swift
//  Tests iOS
//
//  Created by Daniel Tombor on 20/02/2022.
//

=======
>>>>>>> 2541e78 (Create Nest workspace):Apps/Log/Tests iOS/Tests_iOSLaunchTests.swift
import XCTest

class LogIOSLaunchTests: XCTestCase {
    // swiftlint:disable:next empty_xctest_method
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        try super.setUpWithError()

        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
