package com.entity;

public class Keshi {

    private int keshi_id;
    private String kname;

    public Keshi(){

    }

    @Override
    public String toString() {
        return "Keshi{" +
                "keshi_id=" + keshi_id +
                ", kname='" + kname + '\'' +
                '}';
    }

    public int getKeshi_id() {
        return keshi_id;
    }

    public void setKeshi_id(int keshi_id) {
        this.keshi_id = keshi_id;
    }

    public String getKname() {
        return kname;
    }

    public void setKname(String kname) {
        this.kname = kname;
    }
}
