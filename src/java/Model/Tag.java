/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class Tag {
    private int tagId;
    private String tagName;
    private boolean Status;
    private String description;
    private ArrayList<Category> categories;

    public Tag() {
    }

    public Tag(int tagId, String tagName, boolean Status, String description) {
        this.tagId = tagId;
        this.tagName = tagName;
        this.Status = Status;
        this.description = description;
    }

    public Tag(int tagId, String tagName, boolean Status, String description, ArrayList<Category> categories) {
        this.tagId = tagId;
        this.tagName = tagName;
        this.Status = Status;
        this.description = description;
        this.categories = categories;
    }
    
    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<Category> getCategories() {
        return categories;
    }

    public void setCategories(ArrayList<Category> categories) {
        this.categories = categories;
    }
    
}
