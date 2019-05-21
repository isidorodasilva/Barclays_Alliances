////
////  DemoViewController.swift
////  TestCollectionView
////
////  Created by Alex K. on 12/05/16.
////  Copyright © 2016 Alex K. All rights reserved.
////
//
//import UIKit
//import FirebaseDatabase
//
//class DemoViewController: ExpandingViewController {
//   //new test
//    //var aliances: [Aliances] = [Aliances]()
//    //end new test
//    var clickedButton: Int!
//    var descricao: String!
//    
//    
//    typealias ItemInfo = (imageName: String, title: String, descricao: String)
//    fileprivate var cellsIsOpen = [Bool]()
//    fileprivate var items: [ItemInfo]! = [("item4", "Jamson","maputo"), ("item1", "New York","maputo"), ("item2", "San Francisco","maputo"), ("item3", "Washington","maputo"),("item4", "Jamson","maputo")]
//    
//    @IBOutlet var pageLabel: UILabel!
//    
//}
//
//
//// MARK: - Lifecycle 🌎
//
//extension DemoViewController {
//    
//    override func viewDidLoad() {
//        itemSize = CGSize(width: 256, height: 460)
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//        
//        registerCell()
//        fillCellIsOpenArray()
//        addGesture(to: collectionView!)
//
//        configureNavBar()
//        
//        switch clickedButton {
//        case 1:
//            cellsIsOpen.removeAll()
//            items.removeAll()
//            
//            
//            (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.observe(.value, with: { snapshot in
//                let dictRoot = snapshot.value as? [String : AnyObject] ?? [:]
//                let dictAliances = dictRoot["Aliances"] as? [String: AnyObject] ?? [:]
//             //new strategy for image
//                func showImage(){
//                Database.database().reference().child("Aliances").child("photo").observeSingleEvent(of: .value, with: { snapshot in
//                    if let url = snapshot.value as? String {
//                        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
//                            if error == nil {
////                                let imageName = UIImage(data: data!)
////                                UIImageView.image = Image
//                            }
//                            }.resume()
//                    }
//                })
//            }
//                ///end
//                
//                for key in Array(dictAliances.keys) {
//                    let alianceDic = dictAliances[key]
//                    //var str = alianceDic!["Title"] as! String
//                    self.items.append(( "Barclays", alianceDic!["Title"] as! String, alianceDic!["Description"] as! String))
//                    self.cellsIsOpen.append(false)
//                    self.collectionView?.reloadData()
//                }
//                print(dictAliances)
//            })
//            self.collectionView?.reloadData()
//            
//        case 2:
//            cellsIsOpen.removeAll()
//            items.removeAll()
//            (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.observe(.value, with: { snapshot in
//                let dictRoot = snapshot.value as? [String : AnyObject] ?? [:]
//                let dictAliances = dictRoot["Eventos"] as? [String: AnyObject] ?? [:]
//                for key in Array(dictAliances.keys) {
//                    let alianceDic = dictAliances[key]
//                    self.items.append(("item4", alianceDic!["Title"] as! String, alianceDic!["Description"] as! String))
//                    self.cellsIsOpen.append(false)
//                    self.collectionView?.reloadData()
//                }
//                print(dictAliances)
//            })
//            
//        case 3:
//            
//            cellsIsOpen.removeAll()
//            items.removeAll()
//       (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.observe(.value, with: { snapshot in
//                let dictRoot = snapshot.value as? [String : AnyObject] ?? [:]
//                let dictAliances = dictRoot["Newsletter"] as? [String: AnyObject] ?? [:]
//                for key in Array(dictAliances.keys) {
//                    let alianceDic = dictAliances[key]
//                    self.items.append(("item4", alianceDic!["Title"] as! String, alianceDic!["Description"] as! String))
//                    self.cellsIsOpen.append(false)
//                    self.collectionView?.reloadData()
//                }
//                print(dictAliances)
//            })
//            
//            
//            
//        default:
//            break
//        }
//    }
//}
//
//// MARK: Helpers
//
//extension DemoViewController {
//    
//    fileprivate func registerCell() {
//        
//        let nib = UINib(nibName: String(describing: DemoCollectionViewCell.self), bundle: nil)
//        collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: DemoCollectionViewCell.self))
//    }
//    
//    fileprivate func fillCellIsOpenArray() {
//        cellsIsOpen = Array(repeating: false, count: items.count)
//    }
//    
////    fileprivate func getViewController() -> ExpandingTableViewController {
////        //
////
////
////        let storyboard = UIStoryboard(storyboard: .Main)
////        let toViewController: DesignTableViewController = storyboard.instantiateViewController()
////
////        //aqui estamos a definir nome da cidade para a proxima tela
////        toViewController.nomeCidade = descricao
////
////
////
////        return toViewController
////    }
//    
//    fileprivate func configureNavBar() {
//        navigationItem.leftBarButtonItem?.image = navigationItem.leftBarButtonItem?.image!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//    }
//}
//
///// MARK: Gesture
//extension DemoViewController {
//    
////    fileprivate func addGesture(to view: UIView) {
////        let upGesture = Init(UISwipeGestureRecognizer(target: self, action: #selector(DemoViewController.swipeHandler(_:)))) {
////            $0.direction = .up
////        }
////
////        let downGesture = Init(UISwipeGestureRecognizer(target: self, action: #selector(DemoViewController.swipeHandler(_:)))) {
////            $0.direction = .down
////        }
////        view.addGestureRecognizer(upGesture)
////        view.addGestureRecognizer(downGesture)
////    }
//    
////    @objc func swipeHandler(_ sender: UISwipeGestureRecognizer) {
////        let indexPath = IndexPath(row: currentIndex, section: 0)
////        guard let cell = collectionView?.cellForItem(at: indexPath) as? DemoCollectionViewCell else { return }
////        // double swipe Up transition
////        if cell.isOpened == true && sender.direction == .up {
////            pushToViewController(getViewController())
////
////            if let rightButton = navigationItem.rightBarButtonItem as? AnimatingBarButton {
////                rightButton.animationSelected(true)
////            }
////        }
////
////        let open = sender.direction == .up ? true : false
////        cell.cellIsOpen(open)
////        cellsIsOpen[indexPath.row] = cell.isOpened
////    }
//}
//
//// MARK: UIScrollViewDelegate
//
//extension DemoViewController {
//    
//    func scrollViewDidScroll(_: UIScrollView) {
//        pageLabel.text = "\(currentIndex + 1)/\(items.count)"
//    }
//}
//
//// MARK: UICollectionViewDataSource
//
//extension DemoViewController {
//    
//    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        super.collectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
//        guard let cell = cell as? DemoCollectionViewCell else { return }
//        print("\(items.count)")
//        let index = indexPath.row % items.count
//        let info = items[index]
//        cell.backgroundImageView?.image = UIImage(named: info.imageName)
//        cell.customTitle.text = info.title
//        cell.cellIsOpen(cellsIsOpen[index], animated: false)
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        
//        self.descricao = items[indexPath.row].descricao
//        
//        guard let cell = collectionView.cellForItem(at: indexPath) as? DemoCollectionViewCell
//            , currentIndex == indexPath.row else { return }
//        
//        if cell.isOpened == false {
//            cell.cellIsOpen(true)
//        } else {
//            pushToViewController(getViewController())
//            
//            if let rightButton = navigationItem.rightBarButtonItem as? AnimatingBarButton {
//                rightButton.animationSelected(true)
//            }
//        }
//    }
//}
//
//// MARK: UICollectionViewDataSource
//
//extension DemoViewController {
//    
//    override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
//        return items.count
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DemoCollectionViewCell.self), for: indexPath)
//    }
//}
