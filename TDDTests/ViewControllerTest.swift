import XCTest

@testable import TDD

class ViewControllerTest: XCTestCase {
  
  let sut = ViewController()
  
  override func setUp() {
    _ = sut.view
  }
  
  override func tearDown() {
    sut.likeCount = 0
  }
  
  func test_buttons_and_labels_exist_with_correct_title() {
    XCTAssertLessThanOrEqual(sut._likeButton.currentTitle!, "좋아요")
    XCTAssertLessThanOrEqual(sut._likeResetButton.currentTitle!, "초기화")
    XCTAssertLessThanOrEqual(sut._likeDescriptionLabel.text!, "0명이 좋아합니다")
  }
  
  func test_increase_likeCount_when_likeButton_tabbed() {
    likeButton.sendActions(for: .touchUpInside)
    XCTAssertEqual(sut.likeCount, 1)
    XCTAssertLessThanOrEqual(sut._likeDescriptionLabel.text!, "1명이 좋아합니다")
    
    likeButton.sendActions(for: .touchUpInside)
    XCTAssertEqual(sut.likeCount, 2)
    XCTAssertLessThanOrEqual(sut._likeDescriptionLabel.text!, "2명이 좋아합니다")
  }
  
  func test_reset_likeCount_when_likeResetButton_tabbed() {
    let randomLikeNumberBeforeReset = 123
    sut.likeCount = randomLikeNumberBeforeReset
    
    likeResetButton.sendActions(for: .touchUpInside)
    XCTAssertEqual(sut.likeCount, 0)
    XCTAssertLessThanOrEqual(sut._likeDescriptionLabel.text!, "0명이 좋아합니다")
  }
  
  func test_prevent_user_from_liking_more_than_10_times() {
    let maxTimesUserCanLike = 10
    sut.likeCount = maxTimesUserCanLike
    
    sut._likeButton.sendActions(for: .touchUpInside)
    XCTAssertLessThanOrEqual(sut._likeDescriptionLabel.text!, "그만 좀 하세요")
  }
}
