//
//  LanguageMananger+uz.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 25/04/24.
//

import Foundation

extension SetLanguage {
    class func getUzValue(_ type: LanguageType) -> String {
        switch type {
            ///` StartVC
        case .aboutAppDescription:          return """
    "Reja 24" ilovamizga xush kelibsiz. "Reja 24" ilovasi - vazifalarni samarali boshqarish va samaradorlikni oshirish uchun ideal ilova! Bizning ilovamiz yordamida siz tartibli bo'lishingiz va hech narsa unutmaslikka  ishonch hosil qilib, vazifalaringizni bajarishingiz mumkin.
    
    "Reja 24" ilovamizni tanlaganingiz uchun tashakkur.
    """
        case .getStarted:                   return "Boshlash"
            
            ///` ChooseLanguageVC
        case .chooseLanguageLbl:             return "Tilni tanlang"
        case .continueBtn:                   return "Davom ettirish"

            ///`MainVC
        case .homeTitle:                     return "Asosiy"
        case .categoriesTitle:               return "Kategoriyalar"
        case .allBtn:                        return "Yana"
        case .pressPlusForCategoriesMessage: return "Yangi kategoriya qo`shish uchun + bosing"
        case .foldersTitle:                  return "Fayllar"
        case .pressPlusForFoldersMessage:    return "Yangi faly qo`shish uchun + bosing"
        case .tasksForToday:                 return "Bugungi vazifalar"
            
            ///` SettingsVC
        case .languageTitle:                 return "Til"
        case .currentLanguage:               return "O`zbekcha"
        case .darkMode:                      return "Qorong'i rejim"
            
            ///` SideMenu
        case .profileTitle:                  return "Profil"
        case .scheduledTasksTitle:           return "Rejalashtirilgan vazifalar"
        case .settingsTitle:                 return "Sozlamalar"
        case .youHaveTasksMessage:           return "\(SideMenuTV.userName) Sizda \(SideMenuTV.userTasksNumber) ta vazifalar bor"
            
            ///`CreateNewCategoryVC
        case .cancelBtn:                     return "Bekor qilish"
        case .createBtn:                     return "Qo`shish"
        case .writeYourCateNamePlaceholder:  return "Yangi kategoriya nomini kiriting"
        case .favourityCateTitle:            return "Sevimli kategoriya"
        case .selectColorOfCate:             return "Yangi kategoriyangizni rangini tanlang"
            
            ///`CreateNewFolderVC
        case .newFolder:                    return "Yangi fayl"
        case .nameOfNewFolderMessage:       return "Yangi fayl nomini kiriting"
            
            ///`TaksVC
        case .all:                           return "Hammasi"
        case .toDo:                          return "Yangi"
        case .done:                          return "Bajarildi"
        case .addNewTask:                    return "Yangi vazifa qo`shish"
        case .setDeadline:                   return "Vaqtni belgilash"
            
            ///`AddNewTaskVC
        case .nameOfNewTask:                 return "Yangi vazifa nomi"
        case .note:                          return "Qo`shimcha ma`lumot"
        case .selectPriority:                return "Muhimlikni tanlang:"
        case .high:                          return "Yuqori"
        case .medium:                        return "O`rtacha"
        case .low:                           return "Past"
        case .addToList:                     return "Ro'yxatga qo'shish"
            
            ///` FolderVC
        case .addCategoriesBtn:              return "Kategoriyalar qo`shish"
        case .delete:                        return "o`chirish"
        case .warningMessage:                return "Kategoriyalarni o`chirmoqchimisiz ?"
            
            ///` ChooseCategoriesVC
        case .addToFolder:                   return "Faylga qo'shish"
            
            ///` TaskDetailVC
        case .task:                          return "Vazifa"
        case .finished:                      return "Bajarildi"
            
            ///` SearchTaskVC
        case .searchTaskTitle:               return "Vazifani qidirish"
        case .searchYourTaskPlaceholder:     return "Kerakli vazifani qidiring"
            
            ///`ProfileVC
        case .firstNamePlaceholder:          return "Ism"
        case .nextBtn:                       return "Keyingisi"
        case .lastNamePlaceholder:           return "Familiya"
        case .save:                          return "Saqlash"
            
            ///`SetTimerVC
        case .setBtn:                        return "O`rnatish"

            ///`FlaggedTasksVC
        case .flaggedTitle:                  return "Belgilangangan vazifalar"
        case .noFlaggedTasksMessage:         return "Sizda belgilangan vazifalar yo`q"
            
            ///`ScheduledVC
        case .noScheduledTasksMessanger:     return "Sizda rejalashtirilgan vazifalar yo'q"
            
            ///`Aditional
        case .editTask:                      return "Vazifani o`zgartirish"
        case .deleteTask:                    return "Vazifani o`chirish"
        case .deleteCategory:                return "Kategoryani o`chirish"
        case .editCategory:                  return "Kategoryani o`zgartirish"
        case .editFolder:                    return "Faylni o`zgartirish"
        case .deleteFolder:                  return "Faylni o`chirish"
        case .nameCannotBeEmptyMessage:      return "Maydon bo`sh bo`lishishi mumkin emas"
         }
    }

}
