//
//  GKRootViewController.m
//  GoogleKitDemo
//
//  Created by Max Sokolov on 12/11/14.
//  Copyright (c) 2014 Max Sokolov. All rights reserved.
//

#import "GKRootViewController.h"
#import "GKMapGeocoderViewController.h"
#import "GKAutocompleteViewController.h"
#import "GKNearbySearchViewController.h"
#import "GoogleKit.h"

@interface GKRootViewController ()

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation GKRootViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"GoogleKit";
    
    [GKQuery provideAPIKey:@"AIzaSyDYSyHklqn-3aFjic9XatFN5fm8b5Uz15M"];
    //[GKQuery loggingEnabled:YES];
    
    self.dataSource = @[@"Geocoder", @"Autocomplete places", @"Nearby Search"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.dataSource[indexPath.row];

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0: {

            [self.navigationController pushViewController:[GKMapGeocoderViewController new] animated:YES];
            break;
        }
        case 1: {

            [self.navigationController pushViewController:[GKAutocompleteViewController new] animated:YES];
            break;
        }
        case 2: {

            [self.navigationController pushViewController:[GKNearbySearchViewController new] animated:YES];
            break;
        }
        default:
            break;
    }
}

@end