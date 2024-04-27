//
//  SetLanguage.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 27/09/23.
//

import Foundation

class SetLanguage {
    class func setLanguage(_ type: LanguageType) -> String{
        let lang = UserDefaults.standard.string(forKey: Constants.appLanguage)
        if lang == "uz" {
            return getUzValue(type)
        } else if lang == "ru" {
            return getRuValue(type)
        } else {
            return getEngValue(type)
        }
    }
}

enum LanguageType {
    //ChooseLanguageVC
    case chooseLanguageLbl, continueBtn
    //StartVC
    case aboutAppDescription, getStarted
    //MainVC
    case homeTitle, categoriesTitle, allBtn, pressPlusForCategoriesMessage, foldersTitle, pressPlusForFoldersMessage, tasksForToday
    //SettingsVC
    case languageTitle, currentLanguage, darkMode
    //SideMenu
    case profileTitle, scheduledTasksTitle, settingsTitle, youHaveTasksMessage
    //CreateNewCategoryVC
    case cancelBtn, createBtn, writeYourCateNamePlaceholder, favourityCateTitle, selectColorOfCate
    //CreateNewFolderVC
    case newFolder, nameOfNewFolderMessage
    //TaksVC
    case all, toDo, done, addNewTask, setDeadline
    //AddNewTaskVC
    case nameOfNewTask, note, selectPriority, high, medium, low, addToList
    //FolderVC
    case addCategoriesBtn, delete, warningMessage
    //ChooseCategoriesVC
    case addToFolder
    //TaskDetailVC
    case task, finished
    //SearchTaskVC
    case searchTaskTitle, searchYourTaskPlaceholder
    //ProfileVC
    case firstNamePlaceholder, nextBtn, lastNamePlaceholder, save
    //SetTimerVC
    case setBtn
    //FlaggedTasksVC
    case flaggedTitle, noFlaggedTasksMessage
    //SchedualedTasksVC
    case noScheduledTasksMessanger
    //Aditional
    case editCategory, editTask, editFolder, deleteCategory, deleteTask, deleteFolder, nameCannotBeEmptyMessage
}
