# ReusableTableView
Reusable TableView

## About

This repo contains extensions and implementation that avoid repeated UITableViewDataSource and UITableViewDelegate implementations and ensures type-safe code during compliation.


## Steps to use Generic module
1. ReusableTableViewDataManager is the manager that communicates between the viewcontroller and its tableview.
2. ViewController should hold a strong refernce of this Manager.
3. Tableview's datasource and delegate should be this Manager reference.

## Explanation
ReusableTableViewDataManager expects objects confirming to protocols:
(i) DataProvider (that provides set of models) 
(ii) DataBinder (binds model data in cell)

