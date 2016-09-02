//
//  DateSelectorView.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/2.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "DateSelectorView.h"

@interface DateSelectorView()<UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic, strong)UIPickerView *datePicker;

@property(nonatomic, assign)int year;
@property(nonatomic, assign)int month;
@property(nonatomic, assign)int day;
@property(nonatomic, assign)int hours;
@property(nonatomic, assign)int min;

@property(nonatomic, assign)int selectMonDayCount;     //选中月份的天数

@property(nonatomic, strong)NSDateFormatter *dateFormatter;

@end

@implementation DateSelectorView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self getNowTime];
        [self addDetailView];
        [self setDatePickerTime];
    }
    return self;
}

- (void)addDetailView{
    _datePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0,64.0,0.0,0.0)];
    _datePicker.delegate = self;
    _datePicker.dataSource = self;
    [self addSubview:_datePicker];
}

- (void)setDatePickerTime{
    [_datePicker selectRow:_year-2000 inComponent:0 animated:NO];
    [_datePicker selectRow:_month-1 inComponent:1 animated:NO];
    if(_hours == 0){
        [_datePicker selectRow:_day-2 inComponent:2 animated:NO];
        [_datePicker selectRow:22 inComponent:3 animated:NO];
    }else{
        [_datePicker selectRow:_day-1 inComponent:2 animated:NO];
        [_datePicker selectRow:_hours-1 inComponent:3 animated:NO];
    }
    [_datePicker selectRow:_min inComponent:4 animated:NO];
}

// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 5;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    int count = 0;
    if(component == 0){
        count = _year-1999;
    }else if(component == 1){
        count = 12;
    }else if(component == 2){
        count = 31;
    }else if (component == 3){
        count = 24;
    }else if (component == 4){
        count = 60;
    }
    return count;
}

// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 60;
}

/*
 *返回展示的view
 */
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 80)];
    if(component == 0){
        label.text = [NSString stringWithFormat:@"%d年",2000+(int)row];
    }else if(component == 1){
        label.text = [NSString stringWithFormat:@"%d月",1+(int)row];
    }else if(component == 2){
        label.text = [NSString stringWithFormat:@"%d日",1+(int)row];
    }else if(component == 3){
        label.text = [NSString stringWithFormat:@"%d时",(int)row];
    }else if(component == 4){
        label.text = [NSString stringWithFormat:@"%d分",(int)row];
    }
    return label;
}

// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(![self judgeLaterNowTime]){
        if(component == 0 || component == 1 ||component == 2){
            [self adjustToCorrectDate];
        }
    }
}

- (NSDateFormatter *)dateFormatter{
    if(!_dateFormatter){
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"YYYY-MM-dd-HH-mm"];
    }
    return _dateFormatter;
}

- (void)getNowTime{
     NSString *dataSring = [self.dateFormatter stringFromDate:[NSDate date]];
    NSArray *array = [dataSring componentsSeparatedByString:@"-"];
    if(array.count == 5){
        _year = [[array objectAtIndex:0] intValue];
        _month = [[array objectAtIndex:1] intValue];
        _day = [[array objectAtIndex:2] intValue];
        _hours = [[array objectAtIndex:3] intValue];
        _min = [[array objectAtIndex:4] intValue];
    }
}

- (int)returnSelectMonDayCount:(int)year mon:(int)mon{
    int count = 30;
    if(mon == 1 || mon == 3 || mon == 5 || mon == 7 || mon == 8 || mon == 10 || mon == 12){
        count = 31;
    }else if (mon == 2){
        if(year % 4 == 0 ){
            if(year % 100 == 0){
                if(year % 400 == 0){
                    count = 29;
                }else{
                    count = 28;
                }
            }else{
                count = 29;
            }
        }else{
            count = 28;
        }
    }
    return count;
}

- (void)adjustToCorrectDate{
    int yearCount = (int)[_datePicker selectedRowInComponent:0];
    int monCount = (int)[_datePicker selectedRowInComponent:1];
    int dayCount = (int)[_datePicker selectedRowInComponent:2];
    int count = [self returnSelectMonDayCount:yearCount+2000 mon:monCount+1];
    if(count < dayCount+1){
        [_datePicker selectRow:count-1 inComponent:2 animated:YES];
    }
}

- (BOOL)judgeLaterNowTime{
    int yearCount = (int)[_datePicker selectedRowInComponent:0];
    int monCount = (int)[_datePicker selectedRowInComponent:1];
    int dayCount = (int)[_datePicker selectedRowInComponent:2];
    int hoursCount = (int)[_datePicker selectedRowInComponent:3];
    int minCount = (int)[_datePicker selectedRowInComponent:4];
    if(yearCount+2000 > self.year){
        [self setDatePickerTime];
        return YES;
    }else if(yearCount+2000 < self.year){
        return NO;
    }
    if(monCount+1 > self.month){
        [self setDatePickerTime];
        return YES;
    }else if (monCount+1 < self.month){
        return NO;
    }
    if(dayCount+1 > self.day){
        [self setDatePickerTime];
        return YES;
    }else if (dayCount+1 < self.day){
        return NO;
    }
    if(hoursCount > self.hours){
        [self setDatePickerTime];
        return YES;
    }else if (hoursCount > self.hours){
        return NO;
    }
    if(minCount > self.min){
        [self setDatePickerTime];
        return YES;
    }
    return NO;
}

@end
