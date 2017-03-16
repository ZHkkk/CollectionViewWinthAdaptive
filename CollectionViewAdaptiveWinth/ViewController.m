//
//  ViewController.m
//  CollectionViewAdaptiveWinth
//
//  Created by chaoxing-dev on 17/3/16.
//  Copyright © 2017年 chaoxing-dev. All rights reserved.
//

#import "ViewController.h"
#import "ZHCollectionViewCell.h"

#import "ZHCollectionViewFlowLayout.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,ZHCollectionViewFlowLayoutDelegate>
@property(nonatomic,strong)NSArray *  dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataArray = @[@"君不见",@"黄河之水天上来",@"奔流到海不复回",@"君不见",@"高堂明镜悲白发",@"朝如青丝暮成雪",@"人生得意须尽欢",@"莫使金樽空对月",@"天生我材必有用",@"千金散尽还复来",@"烹羊宰牛且为乐",@"会须一饮三百杯",@"岑夫子",@"丹丘生",@"将进酒",@"杯莫停",@"与君歌一曲",@"请君为我倾耳听",@"钟鼓馔玉不足贵",@"但愿长醉不复醒",@"古来圣贤皆寂寞",@"惟有饮者留其名",@"陈王昔时宴平乐",@"斗酒十千恣欢谑",@"主人何为言少钱",@"径须沽取对君酌",@"五花马",@"千金裘",@"呼儿将出换美酒",@"与尔同销万古愁",@"君不见",@"黄河之水天上来",@"奔流到海不复回",@"君不见",@"高堂明镜悲白发",@"朝如青丝暮成雪",@"人生得意须尽欢",@"莫使金樽空对月",@"天生我材必有用",@"千金散尽还复来",@"烹羊宰牛且为乐",@"会须一饮三百杯",@"岑夫子",@"丹丘生",@"将进酒",@"杯莫停",@"与君歌一曲",@"请君为我倾耳听",@"钟鼓馔玉不足贵",@"但愿长醉不复醒",@"古来圣贤皆寂寞",@"惟有饮者留其名",@"陈王昔时宴平乐",@"斗酒十千恣欢谑",@"主人何为言少钱",@"径须沽取对君酌",@"五花马",@"千金裘",@"呼儿将出换美酒",@"与尔同销万古愁"];
    
    ZHCollectionViewFlowLayout * flowLayout = [[ZHCollectionViewFlowLayout alloc]init];
    flowLayout.delegate =self;
    flowLayout.itemSize = CGSizeMake(50, 30);
     
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
     
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[ZHCollectionViewCell class] forCellWithReuseIdentifier:@"identifer"];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZHCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifer" forIndexPath:indexPath];
    cell.backgroundColor= [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    cell.label.text = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView Customlayout:(ZHCollectionViewFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * string = self.dataArray[indexPath.row];
    
    CGSize size = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0]} context:nil].size;
    
    return size.width;
}
@end
