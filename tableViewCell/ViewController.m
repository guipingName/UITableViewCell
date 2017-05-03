//
//  ViewController.m
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "ViewController.h"
#import "YYModel.h"
#import "ButtonCell.h"
#import "ChooseDeviceCell.h"
#import "HeaderCell.h"

#define BASE_TAG    500
#define DEVICE_TAG  501
#define OTHER_TAG   502

#define SET_TIME     @"定时类"
#define NET_GATE    @"网关"
#define THE_DOOR    @"智能门磁"



typedef NS_ENUM(NSInteger, TableViewSection) {
    TableViewSectionBase,
    TableViewSectionDevice,
    TableViewSectionOther,
    TableViewSectionTime,
    TableViewSectionNet,
    TableViewSectionDoor,
};

typedef NS_ENUM(NSInteger, SectionBase) {
    SectionBaseZero,
    SectionBaseOne,
    SectionBaseTwo,
    SectionBaseThree,
    SectionBaseFour,
    SectionBaseFive,
    SectionBaseSix,
    SectionBaseSeven,
};

typedef NS_ENUM(NSInteger, SectionOther) {
    SectionOtherSingleLight,
    SectionOtherLights,
    SectionOtherElectricOdd,
    SectionOtherElectricEven,
    SectionOtherDevice,
    SectionOtherDeviceType,
    SectionOtherLogOne,
    SectionOtherLogTwo,
};

typedef NS_ENUM(NSInteger, SectionTime) {
    SectionTimeTimerNomal,
    SectionTimeTimerHigh,
    SectionTimeTimerDevice,
    SectionTimeTimerTry,
    SectionTimeElectricOn,
    SectionTimeElectricOnAndOff,
    SectionTimeLightOn,
    SectionTimeLogihtOff,
};

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *myTableView;
    NSMutableArray *dataArray;
    NSMutableArray *foldArray;
    NSMutableArray *headerModel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, WIDTH, HEIGHT - 20) style:UITableViewStylePlain];
    [self.view addSubview:myTableView];
    myTableView.backgroundColor = [UIColor whiteColor];
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.dataSource = self;
    myTableView.delegate = self;
    [self loadData];
}

- (void) loadData{
    // 测试数据
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (response == nil) {
        NSLog(@"test.json文件内容===格式错误");
    }
    dataArray = [NSMutableArray array];
    
    NSArray *array = response[@"data"];
    for (NSArray *a in array) {
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dic in a) {
            GPModel *model = [GPModel yy_modelWithDictionary:dic];
            [temp addObject:model];
        }
        [dataArray addObject:temp];
    }
    foldArray = [NSMutableArray array];
    for (int i=0; i<dataArray.count; i++) {
        NSInteger a = 0;
        [foldArray addObject:@(a)];
    }
    
    [self createHeader];
}

#pragma mark --------------- UITableViewDelegate ----------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = dataArray[section];
    NSInteger a = [foldArray[section] integerValue];
    return a ? array.count : 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == TableViewSectionBase) {
        if (indexPath.row == SectionBaseSeven) {
            return UIHEIGHT(160);
        }
        return 50;
    }
    else if (indexPath.section == TableViewSectionNet ||
        indexPath.section == TableViewSectionDoor) {
        return UIHEIGHT(140);
    }
    else if (indexPath.section == TableViewSectionDevice) {
        if (indexPath.row == 0) {
            return UIHEIGHT(284);
        }
        else if (indexPath.row == 15 || indexPath.row == 16 || indexPath.row == 17) {
            return UIHEIGHT(130);
        }
        return UIHEIGHT(160);
    }
    else if (indexPath.section == TableViewSectionOther) {
        if (indexPath.row == SectionOtherSingleLight || indexPath.row == SectionOtherLights) { // 灯光
            return 80;
        }
        else if (indexPath.row == SectionOtherElectricOdd || indexPath.row == SectionOtherElectricEven) { // 电量
            return UIHEIGHT(120);
        }
        else if (indexPath.row == SectionOtherDevice || indexPath.row == SectionOtherDeviceType) {
            return UIHEIGHT(320);
        }
        return 100;
    }
    else if (indexPath.section == TableViewSectionTime) {
        if (indexPath.row == SectionTimeElectricOn) { // 通电
            return UIHEIGHT(110);
        }
        else if (indexPath.row == SectionTimeElectricOnAndOff){ // 通电、断电
            return UIHEIGHT(170);
        }
        else if (indexPath.row == SectionTimeLightOn || indexPath.row == SectionTimeLogihtOff){ // 灯光定时
            return UIHEIGHT(140);
        }
        return UIHEIGHT(140);
    }
    else{
        return 80;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == TableViewSectionTime ||
        section == TableViewSectionNet ||
        section == TableViewSectionDoor) {
        return UIHEIGHT(160);
    }
    return 40;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 2;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == TableViewSectionBase) {
        UIButton *button = [self createButtonWithTitle:@"基本单元格"];
        button.tag = BASE_TAG;
        return button;
    }
    else if (section == TableViewSectionDevice) {
        UIButton *button = [self createButtonWithTitle:@"设备"];
        button.tag = DEVICE_TAG;
        return button;
    }
    else if (section == TableViewSectionOther) {
        UIButton *button = [self createButtonWithTitle:@"其它"];
        button.tag = OTHER_TAG;
        return button;
    }
    else if (section == TableViewSectionTime) {
        HeaderCell *cell = [self createHederView:section - TableViewSectionTime];
        cell.bgImageView.backgroundColor = [UIColor colorWithRed:123/255.0 green:179/255.0 blue:89/255.0 alpha:1];
        cell.bgImageView.image = [cell.bgImageView.image rt_tintedImageWithColor:[UIColor whiteColor]];
        return cell;
    }
    else if (section == TableViewSectionNet ||
             section == TableViewSectionDoor) {
        return [self createHederView:section - TableViewSectionTime];
    }
    return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GPModel *model = dataArray[indexPath.section][indexPath.row];
    BaseTableViewCell *cell = [BaseTableViewCell createCellWithCellModel:model];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GPModel *model = dataArray[indexPath.section][indexPath.row];
    UITableViewCell *cell = [myTableView cellForRowAtIndexPath:indexPath];
    if (model.cellstyle == CellStyleTwoLabelCell) {
        if (model.needUpdate) {
            model.progress = 0.2;
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }
    }
    else if (model.cellstyle == CellStyleButtonCell) {
        ButtonCell *cella = (ButtonCell *)cell;
        cella.rightButton.selected = !cella.rightButton.selected;
        model.selected = cella.rightButton.selected;
    }
    else if (model.cellstyle == CellStyleChooseDeviceCell) {
        ChooseDeviceCell *cella = (ChooseDeviceCell *)cell;
        cella.rightButton.selected = !cella.rightButton.selected;
        model.selected = cella.rightButton.selected;
    }
    else if (model.cellstyle == CellStyleTimerCell) {
        model.isClicked = YES;
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}

- (UIButton *) createButtonWithTitle:(NSString *) title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor  =[UIColor grayColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}


-(HeaderCell *) createHederView:(NSInteger) number{
    GPModel *model = headerModel[number];
    model.cellstyle = CellStyleHeaderCell;
    HeaderCell *view = (HeaderCell *)[BaseTableViewCell createCellWithCellModel:model];
    view.clickedBlock = ^(BOOL isClicked, GPModel *tempModel){
        [self foldOrUnfold:tempModel orIndex:0];
    };
    return view;
}

- (void) buttonClicked:(UIButton *) sender{
    [self foldOrUnfold:nil orIndex:sender.tag - BASE_TAG];
}

- (void) foldOrUnfold:(GPModel *) model orIndex:(NSInteger) index{
    NSInteger tempIndex;
    if (model) {
        if ([model.title isEqualToString:SET_TIME]) {
            tempIndex = TableViewSectionTime;
        }
        else if ([model.title isEqualToString:NET_GATE]){
            tempIndex = TableViewSectionNet;
        }
        else if ([model.title isEqualToString:THE_DOOR]){
            tempIndex = TableViewSectionDoor;
        }
        else{
            return;
        }
    }
    else{
        tempIndex = index;
        if (tempIndex > foldArray.count - 1) {
            return;
        }
    }
    NSInteger a = [foldArray[tempIndex] integerValue];
    [foldArray replaceObjectAtIndex:tempIndex withObject:@(!a)];
    [myTableView reloadData];
}


- (void) createHeader{
    headerModel = [NSMutableArray array];
    GPModel *model = [[GPModel alloc] init];
    model.title = SET_TIME;
    model.isClicked = NO;
    model.imageName = @"定时器_选中";
    [headerModel addObject:model];
    
    GPModel *model1 = [[GPModel alloc] init];
    model1.title = NET_GATE;
    model1.imageName = @"网关S3_168_168";
    model1.subTitle = @"在线3";
    model1.subTitle2 = @"全部3";
    [headerModel addObject:model1];
    
    GPModel *model2 = [[GPModel alloc] init];
    model2.title = THE_DOOR;
    model2.imageName = @"门磁类";
    model2.subTitle = @"布防2";
    model2.subTitle2 = @"在线2";
    model2.subTitle3 = @"全部2";
    [headerModel addObject:model2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
