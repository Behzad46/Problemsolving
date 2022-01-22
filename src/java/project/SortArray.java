package project;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.*;
import java.lang.*;
import java.util.*;


/**
 *
 * @author Behzad
 */

public class SortArray {
class Student {
    int ID;
    String Name;
  
    // Constructor
    public Student( int id, String name)
    {
        // This keyword refers to current object itself
        this.ID = id;
        this.Name = name;
    }
  
    // Used to print student details in main()
    public String toString()
    {
        return this.ID + " " + this.Name;
    }
}
// Class 2
// Helper class extending Compatator interface
class SortbyID implements Comparator<Student> {
    // Used for sorting in ascending order of
    // ID number
    public int compare(Student a, Student b)
    {
        return a.ID - b.ID;
    }
}
// Class 3
// Helper class extending Compatator interface
class SortbyName implements Comparator<Student> {
    // Used for sorting in ascending order of
    // ID number
    public int compare(Student a, Student b)
    {
        return a.Name.compareTo(b.Name);
    }
}
    Student[] arr
            = { new Student(06, "C#"),
                new Student(07, "MVC Pattern"),
                new Student(12, "Java Spring") ,
                new Student(01, "Microsoft SQL Server"),
                new Student(02, "Java"),
                new Student(03, "J2EE"),
                new Student(04, "Asp.Net Core"),
                new Student(05, "JSP"),
            };
    public int ArrayLength(){
        return arr.length;
    }
    public int ArrayID(int i0){
        Arrays.sort(arr, new SortbyID());

        return arr[i0].ID;
    }
    public String ArrayName(int j0){
        Arrays.sort(arr, new SortbyID());

        return arr[j0].Name;
    }
    public  Student StudentsArray(int i){
        //Arrays.sort(arr, new SortbyID());
        Arrays.sort(arr, new SortbyName());
        
    return arr[i];
       
        
    
    }

}
