//
//  ContentView.swift
//  TimeManagement
//  Created by Nikita Dubinker on 4/8/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Первые два прямоугольника
                HStack(spacing: 20) {
                    NavigationLink(destination: BDayView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.bDay)
                                .frame(width: 170, height: 360)
                            VStack {
                                Image(colorScheme == .dark ? "BDayBlack" : "BDay")
                                    .resizable()
                                    .frame(width: 102, height: 80)
                                Text("BDay")
                                    .font(.title2)
                            }
                        }
                    }
                    
                    NavigationLink(destination: ToDoListView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.toDoList)
                                .frame(width: 170, height: 360)
                            VStack {
                                Image(colorScheme == .dark ? "ToDoListBlack" : "ToDoList")
                                    .resizable()
                                    .frame(width: 67, height: 80)
                                Text("To Do List")
                                    .font(.title2)
                            }
                        }
                    }
                }
                
                // Вторые два прямоугольника
                HStack(spacing: 20) {
                    NavigationLink(destination: NotesView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.notes)
                                .frame(width: 170, height: 360)
                                .padding(.bottom, 25)
                            VStack {
                                Image(colorScheme == .dark ? "NotesBlack" : "Notes")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                Text("Notes")
                                    .font(.title2)
                            }
                        }
                    }
                    
                    NavigationLink(destination: HabitTrackerView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.habitTracker)
                                .frame(width: 170, height: 360)
                                .padding(.bottom, 25)
                            VStack {
                                Image(colorScheme == .dark ? "HabitTrackerBlack" : "HabitTracker")
                                    .resizable()
                                    .frame(width: 130, height: 80)
                                Text("Habit Tracker")
                                    .font(.title2)
                            }
                        }
                    }
                }
            }
        }
    }
}
