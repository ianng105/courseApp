package com.example.courseapp.models;

import jakarta.persistence.*;

@Entity
public class Attachment {


    @Id
    @GeneratedValue
    private String a_id;
    private String name;
    private String mimeContentType;
    private byte[] contents;
    @Column(name="lecture_id", insertable=false, updatable=false)
    private String L_id;

    @ManyToOne
    @JoinColumn(name = "lecture_id")
    private Lecture lecture;

    // Getters and Setters of id, name, mimeConten tType, contents
    public String getId() {
        return a_id;
    }

    public void setId(String id) {
        this.a_id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMimeContentType() {
        return mimeContentType;
    }

    public void setMimeContentType(String mimeContentType) {
        this.mimeContentType = mimeContentType;
    }

    public byte[] getContents() {
        return contents;
    }

    public void setContents(byte[] contents) {
        this.contents = contents;
    }

    public Lecture getLecture(){
        return lecture;
    }

    public void setLecture(Lecture l){
        lecture=l;
    }

    public String getL_id(){
        return lecture.getL_id();
    }
}