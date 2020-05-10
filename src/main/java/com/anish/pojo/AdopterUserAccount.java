package com.anish.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name="adopteruseraccount_table")
@PrimaryKeyJoinColumn(name="email")

public class AdopterUserAccount {
	public AdopterUserAccount() {
		
	}
	
//	@Id
//	@GeneratedValue(generator = "generator")
//	@GenericGenerator(name="generator", strategy="foreign", parameters=@Parameter(name="property", value="adopter_table"))
//	@Column(name="adopteraccountid", unique=true, nullable=false)
//	private long accountId;
	
	@Column(name="password")
	private String password;
	
	//@OneToOne
	//@PrimaryKeyJoinColumn
	@Transient
	private Adopter adopter;
	
	@Id
	//@GeneratedValue(generator="generator")
	@GeneratedValue(generator="generator")
	@GenericGenerator(name="generator" ,strategy="assigned")
	@Column(name="adopteremail", unique=true, nullable=false)
	private String adopterEmail;
	
//	public long getAccountId() {
//		return accountId;
//	}
//	public void setAccountId(long accountId) {
//		this.accountId = accountId;
//	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Adopter getAdopter() {
		return adopter;
	}
	public void setAdopter(Adopter adopter) {
		this.adopter = adopter;
	}
	public String getAdopterEmail() {
		return adopterEmail;
	}
	public void setAdopterEmail(String adopterEmail) {
		this.adopterEmail = adopterEmail;
	}
	
	
}
