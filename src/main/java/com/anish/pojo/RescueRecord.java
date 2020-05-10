package com.anish.pojo;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.Filters;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.ParamDef;

@Entity
@Table(name="rescuerecord_table")

public class RescueRecord {
	public RescueRecord() {
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="recordid", unique= true, nullable=false)
	private long id;
	
	@Transient
	private Child child;

	@Column(name="childid")
	private long childid;
	
	@Transient
	private Employee registrator;
	
	@Column(name="registratorid")
	private long registratorid;
	
	@Column(name="date")
	private String date;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Child getChild() {
		return child;
	}
	public void setChild(Child child) {
		this.child = child;	
	}
	
	public Employee getRegistrator() {
		return registrator;
	}
	public void setRegistrator(Employee registrator) {
		this.registrator = registrator;
	}
	public long getChildid() {
		return childid;
	}
	public void setChildid(long childid) {
		this.childid = childid;
	}
	public long getRegistratorid() {
		return registratorid;
	}
	public void setRegistratorid(long registratorid) {
		this.registratorid = registratorid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(int month, int date, int year) {
		this.date = month + "/" + date + "/" + year;
	}
	
	
}
