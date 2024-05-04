//
//  LanguageMananger+eng.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 25/04/24.
//

import Foundation

extension SetLanguage {
    class func getEngValue(_ type: LanguageType) -> String {
        switch type {
            ///` StartVC
        case .aboutAppDescription:           return """
    Welcome to our "Reja 24" app. "Reja 24" app - your ultimate tool for efficient task management and productivity! With our app, you can stay organized and on top of your tasks, ensuring nothing falls through the cracks.
    
    Thank you for choosing our "Reja 24" app.
    """
        case .getStarted:                    return "Get started"
            
            ///` ChooseLanguageVC
        case .chooseLanguageLbl:             return "Choose language"
        case .continueBtn:                   return "Continue"
            
            ///` MainVC
        case .homeTitle:                     return "Home"
        case .categoriesTitle:               return "Categories"
        case .allBtn:                        return "all"
        case .pressPlusForCategoriesMessage: return "Press + to add new category"
        case .foldersTitle:                  return "Folders"
        case .pressPlusForFoldersMessage:    return "Press + to add new folder"
        case .tasksForToday:                 return "Tasks for today"
        case .newCategory:                   return "New category"
            
            ///` SettingsVC
        case .languageTitle:                 return "Language"
        case .currentLanguage:               return "English"
        case .darkMode:                      return "Dark mode"
            
            ///` SideMenu
        case .profileTitle:                  return "Profile"
        case .scheduledTasksTitle:           return "Scheduled tasks"
        case .settingsTitle:                 return "Settings"
        case .youHaveTasksMessage:           return "\(SideMenuTV.userName) You have \(SideMenuTV.userTasksNumber) task"
            
            ///` CreateNewCategoryVC
        case .cancelBtn:                     return "Cancel"
        case .createBtn:                     return "Create"
        case .writeYourCateNamePlaceholder:  return "Write your category name"
        case .favourityCateTitle:            return "Favourity category"
        case .selectColorOfCate:             return "Select color of new category"
            
            ///` CreateNewFolderVC
        case .newFolder:                     return "New folder"
        case .nameOfNewFolderMessage:        return "Enter name of new folder"
            
            ///`TaksVC
        case .all:                           return "All"
        case .toDo:                          return "To Do"
        case .done:                          return "Done"
        case .addNewTask:                    return "Add new task"
        case .setDeadline:                    return "Set deadline"
            
            ///`AddNewTaskVC
        case .nameOfNewTask:                 return "Name of new task"
        case .note:                          return "Description"
        case .selectPriority:                return "Select priority:"
        case .high:                          return "High"
        case .medium:                        return "Medium"
        case .low:                           return "Low"
        case .addToList:                     return "Add to list"
            
            ///` FolderVC
        case .addCategoriesBtn:              return "Add categories"
        case .delete:                        return "delete"
        case .warningMessage:                return "Do you want to delete categories?"
        case .noAnyCategory:                 return "You do not have category"
            
            ///` ChooseCategoriesVC
        case .addToFolder:                   return "Add to folder"
            
            ///` TaskDetailVC
        case .task:                          return "Task"
        case .finished:                      return "Completed"
        case .notFinished:                   return "Not completed"
        case .status:                        return "Status"
            
            ///` SearchTaskVC
        case .searchTaskTitle:               return "Search tasks"
        case .searchYourTaskPlaceholder:     return "Search your task"
            
            ///`ProfileVC
        case .firstNamePlaceholder:          return "First name"
        case .nextBtn:                       return "Next"
        case .lastNamePlaceholder:           return "Last name"
        case .save:                          return "Save"

            ///`SetTimerVC
        case .setBtn:                        return "Set"

            ///`Flagged
        case .flaggedTitle:                  return "Flagged"
        case .noFlaggedTasksMessage:         return "You do not have any flagged tasks"
            
            ///`ScheduledVC
        case .noScheduledTasksMessanger:      return "You do not have scheduled tasks"

            ///`Aditional
        case .editTask:                      return "Edit task"
        case .deleteTask:                    return "Delete task"
        case .deleteCategory:                return "Delete category"
        case .editCategory:                  return "Edit category"
        case .editFolder:                    return "Edit folder"
        case .deleteFolder:                  return "Delete folder"
        case .nameCannotBeEmptyMessage:      return "The field cannot be empty"
        }
    }

}
