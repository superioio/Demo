//
//  ScrollView.swift
//  2ndTest
//
//  Created by ZhangJun on 2017/8/30.
//  Copyright © 2017年 ZhangJun. All rights reserved.
//

import UIKit
import CHIPageControl

class ScrollView: UIScrollView ,UIScrollViewDelegate{
    
    var mainScrollView:UIScrollView!
    var mainPageControl:CHIBasePageControl!
    var width :CGFloat!
    var height :CGFloat!
    var x :CGFloat!
    var y :CGFloat!

    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
       // fatalError("init(coder:) has not been implemented")
        
        super.init(coder: aDecoder)
        width = self.bounds.width
        height = self.bounds.height
        x = 0
        y = 0

        
        setUI()
        self.addTimer()
    }
    
    func setUI()
    {
        self.setScrollViewUI()
        self.setPageControlUI()
      //  self.setLableUI()
    }
//    func setLableUI() {
//        picDescript = UILabel(frame: CGRect(x: x, y: y+height/1.5, width: width, height: height/3))
//        addSubview(picDescript)
//        picDescript.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
//
//        picDescript.textColor = UIColor.white
//        picDescript.textRect(forBounds: CGRect(x: 0, y: 0, width: width, height: height/4), limitedToNumberOfLines: 2)
//        picDescript.textAlignment = .natural
        //picDescript.te
        //let string = imageName[0][2] + "\n" + imageName[0][1]
//        let title = NSString(string: imageName[0][2])
//        let str = NSString(string: string)
//        let attrstr = NSMutableAttributedString(string: string)
//        attrstr.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: 15), range: NSMakeRange(0, title.length))
//        attrstr.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 12), range: NSMakeRange(title.length, str.length-1))

       // picDescript.attributedText = attrstr
        //picDescript.text = string
   // }
//    var imageName = [
//        ["image1","第一张图第一张图第一张图第一张图第一张图第一张图第一张图第一张图第一张图第一张图","Title"],
//        ["image2","第二张图","Title"],
//        ["image3","第三张图","Title"]
//    ]
    var imageName = [
    "hotel_avd1","hotel_avd2","hotel_avd3","hotel_avd4","hotel_avd5"
    ]
    func setScrollViewUI()
    {
                self.mainScrollView = UIScrollView(frame: CGRect(x:x, y:y,width: width,height: height))
        // 添加到父视图
        self.addSubview(self.mainScrollView)
        
        var originX:CGFloat = 0
        
        let image0 = UIImageView(frame: CGRect(x:0, y:0,width: width,height: height))
        mainScrollView.addSubview(image0)
        image0.image = UIImage(named: imageName[imageName.count-1])
        //image0.contentMode = .scaleAspectFill

        for i in 0...(imageName.count-1){
            let imagev = UIImageView(frame: CGRect(x:CGFloat(i+1)*width, y:0,width: width,height: height))
            mainScrollView.addSubview(imagev)
            imagev.image = UIImage(named: imageName[i])
         //   imagev.contentMode = .scaleAspectFill
        }
        let imagex = UIImageView(frame: CGRect(x:CGFloat(imageName.count+1)*width, y:0,width: width,height: height))
        mainScrollView.addSubview(imagex)
        imagex.image = UIImage(named: imageName[0])
       // imagex.contentMode = .scaleAspectFill

//            let image_1 = UIImageView(frame: CGRect(x:0, y:0,width: self.bounds.width,height: self.bounds.height))
//        let image_1 = UIImageView(frame: CGRect(x:0, y:0,width: self.bounds.width,height: self.bounds.height))
//        let image_1 = UIImageView(frame: CGRect(x:0, y:0,width: self.bounds.width,height: self.bounds.height))
//        let image_2 = UIImageView(image: #imageLiteral(resourceName: "image1"))
//            let image_3 = UIImageView(image: #imageLiteral(resourceName: "image3"))
//        image_1.contentMode = .scaleAspectFit
//        image_2.contentMode = .scaleAspectFit
//        image_3.contentMode = .scaleAspectFit
           // self.mainScrollView.addSubview(image_1)
//        originX += image_1.frame.minX + image_1.frame.width
           // self.mainScrollView.addSubview(image_2)
//        originX += image_2.frame.minX + image_2.frame.width
           // self.mainScrollView.addSubview(image_3)
//        originX += image_3.frame.minX + image_3.frame.width
        
        originX = CGFloat(imageName.count + 2) * width
        // 背景颜色
//        self.mainScrollView.backgroundColor = UIColor(red: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), green: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), alpha: 1.0)
        // 自适应父视图
         self.mainScrollView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        // 其他属性
        self.mainScrollView.isScrollEnabled = true // 可以上下滚动
        self.mainScrollView.scrollsToTop = true // 点击状态栏时，可以滚动回顶端
        self.mainScrollView.bounces = true // 在最顶端或最底端时，仍然可以滚动，且释放后有动画返回效果
        mainScrollView.isPagingEnabled = true // 分页显示效果
        mainScrollView.showsHorizontalScrollIndicator = false // 不显示水平滚动条
        mainScrollView.showsVerticalScrollIndicator = false // 不显示垂直滚动条
       // mainScrollView.indicatorStyle = UIScrollViewIndicatorStyle.default // 滑动条的样式
        // 设置内容大小
        self.mainScrollView.contentSize = CGSize(width: originX, height: 0)

        // 代理
        self.mainScrollView.delegate = self
        //显示第二张
        mainScrollView.setContentOffset(CGPoint(x:width,y:0), animated: true)
    }
    
    func setPageControlUI()
    {
        self.mainPageControl = CHIPageControlJaloro(frame: CGRect(x: 15, y: self.bounds.height-55, width: self.bounds.width-30, height: 20))
            //((CGRectGetWidth(self.bounds) - 200.0) / 2, (CGRectGetHeight(self.bounds) - 20.0 - 10.0), 200.0, 20.0))

        // 添加到父视图
        addSubview(self.mainPageControl)
        // 背景颜色
        self.mainPageControl.backgroundColor = UIColor.clear
        
        // 其他属性设置
        mainPageControl.radius = 5
        mainPageControl.padding = 8
        mainPageControl.numberOfPages = 5 // 总页数
        mainPageControl.progress = 0 // 当前页数，默认为0，即第一个，实际数量是0~n-1
        mainPageControl.tintColor = UIColor.lightGray // 非当前页颜色
        mainPageControl.currentPageTintColor = UIColor.black // 当前页颜色
        
      //  mainPageControl.addTarget(self, action: #selector(pageChanged), for: .valueChanged)
    }
    
//    func pageChanged(_ sender:UIPageControl) {
//        var frame = mainScrollView.frame
////        if page <= imageName.count{
////            page += 1
////        }
//        frame.origin.x = width * CGFloat(page)
//        frame.origin.y = 0
//        
//        mainScrollView.scrollRectToVisible(frame, animated: true)
//    }
    
    // MARK: - UIScrollViewDelegate
    

    
    
    // MARK: - timer
    var mainTimer:Timer!
    func addTimer()
    {
        self.mainTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector:  #selector(autoShow), userInfo: nil, repeats: true)
    }
    
    func removerTimer()
    {
        if self.mainTimer != nil
        {
            self.mainTimer.invalidate()
            self.mainTimer = nil
        }
    }
    var page = 0
    func autoShow()
    {
       // var page = self.mainPageControl.currentPage
        if imageName.count-1 <= page
        {
            page = 0
        }
        else
        {
            page += 1
        }
        
        showPic(isAnimated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    {
        print("1 scrollViewWillBeginDragging")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        print("2 scrollViewDidScroll")
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        print("3 scrollViewWillEndDragging")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool)
    {
        print("4 scrollViewDidEndDragging")
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView)
    {
        print("5 scrollViewWillBeginDecelerating")
    }
    //手翻页
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        print("6 scrollViewDidEndDecelerating")
        
        let offsetX = mainScrollView.contentOffset.x
        var index = offsetX / width
        print("当前页偏移量：\(offsetX)")
        print("当前页是：\(index)")
        //最后一张回到第一章
        if index > CGFloat(mainPageControl.numberOfPages){
            index = 0
        }
        else if index<1 {//往左滑到第0张，则回到最后一张
            index = CGFloat(mainPageControl.numberOfPages-1)
        }
        else{
            index -= 1
        }
        page = Int(index)
        showPic(isAnimated: false)
    }
    
    func showPic(isAnimated:Bool) {
       // self.mainPageControl.currentPage = page
        mainPageControl.set(progress: page, animated: true)
        self.mainScrollView.setContentOffset(CGPoint(x:CGFloat(page+1) * width,y:0), animated: isAnimated)

    }
//    //自动翻页
//    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//    }
//    
//    var cnt = 0
    
}
