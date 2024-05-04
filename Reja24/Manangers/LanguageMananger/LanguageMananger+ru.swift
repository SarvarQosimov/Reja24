//
//  LanguageMananger+ru.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 25/04/24.
//

import Foundation

extension SetLanguage {
    class func getRuValue(_ type: LanguageType) -> String {
        switch type {
            ///` StartVC
        case .aboutAppDescription:           return """
    Добро пожаловать в наше приложение "Reja 24". Приложение "Reja 24"  - ваш идеальный инструмент для эффективного управления задачами и повышения производительности! С помощью нашего приложения вы можете оставаться организованным и справляться со своими задачами, гарантируя, что ничего не выйдет из-под контроля.
    
    Благодарим вас за то, что выбрали наше приложение "Reja 24".
    """
        case .getStarted:                    return "Начать"
            
            ///` ChooseLanguageVC
        case .chooseLanguageLbl:             return "Выберите язык"
        case .continueBtn:                   return "Продолжить"

            ///` MainVC
        case .homeTitle:                     return "Главная"
        case .categoriesTitle:               return "Категории"
        case .allBtn:                        return "все"
        case .pressPlusForCategoriesMessage: return "Hажмите +, чтобы добавить новую категорию"
        case .foldersTitle:                  return "Папки"
        case .pressPlusForFoldersMessage:    return "Hажмите +, чтобы добавить новую папку"
        case .tasksForToday:                 return "Сегодняшние задачи"
        case .newCategory:                   return "Новая категория"
            
            ///` SettingsVC
        case .languageTitle:                 return "Язык"
        case .currentLanguage:               return "Русский"
        case .darkMode:                      return "Темный режим"
            
            ///` SideMenu
        case .profileTitle:                  return "Профиль"
        case .scheduledTasksTitle:           return "Запланированные задачи"
        case .settingsTitle:                 return "Настройки"
        case .youHaveTasksMessage:           return "\(SideMenuTV.userName) У Вас eсть \(SideMenuTV.userTasksNumber) задачи"
            
            ///` CreateNewCategoryVC
        case .cancelBtn:                     return "Отменить"
        case .createBtn:                     return "Создать"
        case .writeYourCateNamePlaceholder:  return "Напишите название своей категории"
        case .favourityCateTitle:            return "Ваша любимая категория"
        case .selectColorOfCate:             return "Выберите цвет для новой категории"
            
            ///` CreateNewFolderVC
        case .newFolder:                     return "Новая папка"
        case .nameOfNewFolderMessage:        return "Введите имя новой папки"
            
            ///` TaksVC
        case .all:                           return "Все"
        case .toDo:                          return "Новый"
        case .done:                          return "Сделано"
        case .addNewTask:                    return "Добавить новую задачу"
        case .setDeadline:                    return "Установить время"
            
            ///`AddNewTaskVC
        case .nameOfNewTask:                 return "Название новой задачи"
        case .note:                          return "Описание"
        case .selectPriority:                return "Выберите приоритет:"
        case .high:                          return "Высокий"
        case .medium:                        return "Средний"
        case .low:                           return "Низкий"
        case .addToList:                     return "Добавить в список"
            
            ///` FolderVC
        case .addCategoriesBtn:              return "Добавить категории"
        case .delete:                        return "удалить"
        case .warningMessage:                return "Хотите удалить категории ?"
        case .noAnyCategory:                 return "У вас нет категории"
            
            ///` ChooseCategoriesVC
        case .addToFolder:                   return "Добавить в папку"
            
            ///` TaskDetailVC
        case .task:                          return "Задача"
        case .finished:                      return "Завершенный"
        case .notFinished:                   return "Не завершено"
        case .status:                        return "Статус"
            
            ///` SearchTaskVC
        case .searchTaskTitle:               return "Поиск задач"
        case .searchYourTaskPlaceholder:     return "Поиск задач"

            ///`ProfileVC
        case .firstNamePlaceholder:          return "Имя"
        case .nextBtn:                       return "Следующий"
        case .lastNamePlaceholder:           return "Фамилия"
        case .save:                          return "Сохранить"
            
            ///`SetTimerVC
        case .setBtn:                        return "Установить"

            ///`FlaggedTasksVC
        case .flaggedTitle:                  return "С флажком"
        case .noFlaggedTasksMessage:         return "У вас нет никаких задач c флажком"
            
            ///`ScheduledVC
        case .noScheduledTasksMessanger:     return "У вас нет запланированных задач"
            
            ///`Aditional
        case .editTask:                      return "Изменить задачу"
        case .deleteTask:                    return "Удалить задачу"
        case .deleteCategory:                return "Удалить категорию"
        case .editCategory:                  return "Изменить категорию"
        case .editFolder:                    return "Изменить папку"
        case .deleteFolder:                  return "Удалить папку"
        case .nameCannotBeEmptyMessage:      return "Поле не может быть пустым"
        }
    }

}
