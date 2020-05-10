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
@Table(name="employee_table")
//@PrimaryKeyJoinColumn(name="employeeid")

public class Employee {
	public Employee() {
		
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	//@GenericGenerator(name="generator" ,strategy="assigned")
	@Column(name="employeeid", unique= true, nullable=false)
	private long employeeId;
	
	@Column(name="name")
	private String name;
	
	@Column(name="role")
	private String role;
	
	@Transient
	private EmployeeUserAccount account;
	
//	@Column(name="role")
//	private long employeeUserAccountId;
	
	public long getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public EmployeeUserAccount getAccount() {
		return account;
	}
	public void setAccount(EmployeeUserAccount account) {
		this.account = account;
	}
	
	@Override
	public String toString() {
		return name;
	}
	
	
}
