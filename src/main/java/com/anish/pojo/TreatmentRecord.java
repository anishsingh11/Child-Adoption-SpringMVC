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
@Table(name="treatmentrecord_table")

public class TreatmentRecord {
	public TreatmentRecord() {
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="treatmentid", unique= true, nullable=false)
	private long id;
	
	@Transient
	private Child child;

	@Column(name="childid")
	private long childid;
	
	@Transient
	private Employee doctor;

	@Column(name="doctorid")
	private long doctorid;
	
	@Column(name="date")
	private String date;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Child getChildl() {
		return child;
	}
	public void setChild(Child child) {
		this.child = child;
	}
	
	public Employee getDoctor() {
		return doctor;
	}
	
	public void setDoctor(Employee doctor) {
		this.doctor = doctor;
	}
	
	public long getChildid() {
		return childid;
	}
	public void setChildid(long childid) {
		this.childid = childid;
	}
	public long getDoctorid() {
		return doctorid;
	}
	public void setDoctorid(long doctorid) {
		this.doctorid = doctorid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(int month, int date, int year) {
		this.date = month + "/" + date + "/" + year;
	}
}
