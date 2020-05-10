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
import org.hibernate.annotations.Parameter;

@Entity
@Table(name="employeeuseraccount_table")

public class EmployeeUserAccount {
	public EmployeeUserAccount() {
		
	}
	
	//@Id
	//@GeneratedValue(generator = "generator")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	//@GenericGenerator(name="generator", strategy="foreign", parameters=@Parameter(name="property", value="employee"))
//	@Column(name="accountid", unique=true, nullable=false)
//	private long accountId;
	
	@Column(name="password")
	private String password;
	
	//@OneToOne
	//@PrimaryKeyJoinColumn
	@Transient
	private Employee employee;
	
	@Id
	@GeneratedValue(generator="generator")
	@GenericGenerator(name="generator" ,strategy="assigned")
	@Column(name="employeeid", unique=true, nullable=false)
	private long employeeid;
	
//	public long getAccountId() {
//		return accountId;
//	}
//
//	public void setAccountId(long accountId) {
//		this.accountId = accountId;
//	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public long getEmployeeid() {
		return employeeid;
	}

	public void setEmployeeid(long employeeid) {
		this.employeeid = employeeid;
	}
	
	
}
