import UIKit

class ViewController: UIViewController {
  
  var likeCount = 0
  
  let _likeButton = likeButton
  let _likeResetButton = likeResetButton
  let _likeDescriptionLabel = likeDescriptionLabel
  
  func setUpUIPositionAndTargets() {
    let viewCenterX = view.center.x
    let viewCenterY = view.center.y
    
    _likeButton.center = CGPoint(x: viewCenterX, y: viewCenterY + 50)
    _likeDescriptionLabel.center = CGPoint(x: viewCenterX, y: viewCenterY + -50)
    _likeResetButton.center = CGPoint(x: viewCenterX, y: viewCenterY  + 120)
    
    _likeButton.addTarget(self, action: #selector(didTabLikeButton), for: .touchUpInside)
    
    _likeResetButton.addTarget(self, action: #selector(didTabLikeResetButton), for: .touchUpInside)
  }
  
  @objc func didTabLikeButton() {
    editLikeDescriptionLabelBasedOnLikeCount(likeCount: &likeCount)
  }
  
  @objc func didTabLikeResetButton() {
    resetLikeCountAndEditLikeLabelDescription(likeCount: &likeCount)
  }
  
  func addSubviews() {
    view.addSubview(_likeButton)
    view.addSubview(_likeResetButton)
    view.addSubview(_likeDescriptionLabel)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpUIPositionAndTargets()
    addSubviews()
  }
  
  func editLikeDescriptionLabelBasedOnLikeCount(likeCount: inout Int) {
    likeCount += 1
    
    guard likeCount <= 10 else {
      _likeDescriptionLabel.text = "그만 좀 하세요"
      return
    }
    
    _likeDescriptionLabel.text = "\(likeCount)명이 좋아합니다"
  }
  
  func resetLikeCountAndEditLikeLabelDescription(likeCount: inout Int) {
    likeCount = 0
    _likeDescriptionLabel.text = "0명이 좋아합니다"
  }
  
}


