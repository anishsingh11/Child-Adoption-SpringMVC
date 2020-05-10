package com.anish.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
@Table(name="child_table")

public class Child {
	
	
	public Child() {
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="childId", unique=true, nullable=false)
	private int childId;
        
        @Column(name="name")
	private String name;
	
	@Column(name="type")
	private String type;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="color")
	private String color;
        
        @Column(name="age")
        private int age;
	
	@Column(name="status")
	private String status;
	
	@Column(name="photoPath")
	private String file;
	
	@Transient
	private CommonsMultipartFile photo;
	
	public int getChildId() {
		return childId;
	}

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
        
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public CommonsMultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(CommonsMultipartFile photo) {
		this.photo = photo;
	}

        public int getAge() {
            return age;
        }

        public void setAge(int age) {
            this.age = age;
        }
        
	public boolean isNotTreated() {
		if( this.status.equals("untreated") ) {
			return true;
		}
		else {
			return false;
		}
	}
	
}
