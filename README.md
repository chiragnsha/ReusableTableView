# ReusableTableView
Reusable TableView

## About

This repo contains extensions and implementation that avoid repeated UITableViewDataSource and UITableViewDelegate implementations and ensures type-safe code during compliation.


## Steps to use Generic module
1. ReusableTableViewDataManager is the manager that communicates between the viewcontroller and its tableview.
2. ViewController should hold a strong refernce of this Manager.
3. Tableview's datasource and delegate should be this Manager reference.

## Abstract Explanation
ReusableTableViewDataManager expects objects confirming to protocols:
- DataProvider (that provides set of models) 
- DataBinder (binds model data in cell)

## Demo - Explanation
- Phone App - This mimics the iOS Phone app UI, where the datasource is updated on segment control change.
- Mail app - This ViewController loads a sample data of Mails with unread state.
- Whatsapp - This screen is similar to whatsapp's chat list - screen was designed in storyboard (this module works with storyboard screens also.)
- Messages - This screen shows a threaded conversation like in messages app.
- AppStore - This screen demonstrates app-search like in stock Appstore app (using AppTweak for API)

## AppDemo - UI

![Alt text](appdemo.gif?raw=true "Optional Title")

