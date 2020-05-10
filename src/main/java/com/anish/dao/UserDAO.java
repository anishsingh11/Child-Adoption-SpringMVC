package com.anish.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.anish.exception.AdopterException;
import com.anish.exception.ChildException;
import com.anish.exception.EmployeeException;
import com.anish.pojo.Adopter;
import com.anish.pojo.AdopterUserAccount;
import com.anish.pojo.Child;
import com.anish.pojo.Employee;
import com.anish.pojo.EmployeeUserAccount;


public class UserDAO extends DAO{
//	public void addAdopter(AdopterUserAccount aua, String phone, String address, String lastname, String firstname) throws AdopterException{
//		try{
//			begin();
//			AdopterUserAccount account = aua;
//			Adopter a = aua.getAdopter();
//			a.setAccount(aua);
//			a.setAddress(address);
//			a.set
//			Session session = getSession();
//			session.save(a);
//			commit();
//		}
//		catch(HibernateException he){
//			rollback();
//			throw new AdopterException("Error:"+he.getMessage());
//		}
//	}
	
	public Adopter addAdopter(String email, String password, String lastname, String firstname, String gender, String address, String phone) throws AdopterException{
		try{
			
			AdopterUserAccount aua = new AdopterUserAccount();
			Adopter adopter = new Adopter();
			begin();
			
			adopter.setAddress(address);
			adopter.setGender(gender);
			adopter.setEmail(email);
			adopter.setFirstName(firstname);
			adopter.setLastName(lastname);
			adopter.setPhone(phone);
			Session session = getSession();
			session.save(adopter);
			commit();
			close();
			
			begin();
			aua.setAdopter(adopter);
			aua.setPassword(password);
			aua.setAdopterEmail(email);
			adopter.setAccount(aua);
			session = getSession();
			session.save(aua);
			System.out.println(aua.getAdopterEmail());
			System.out.println(aua.getPassword());
			commit();
			close();
			
			
			return adopter;
		}
		catch(HibernateException he){
			rollback();
			throw new AdopterException("Error:"+he.getMessage());
		}
	}
	
	public AdopterUserAccount getAdopterUserAccount(String email, String password) throws AdopterException {
		try{
			begin();
			Query q = getSession().createQuery("from AdopterUserAccount where adopteremail = :adopteremail and password = :password");
			q.setString("adopteremail", email);
			q.setString("password", password);
			AdopterUserAccount aua = (AdopterUserAccount) q.uniqueResult();
			System.out.println(aua.getAdopterEmail());
			System.out.println(aua.getPassword());
			commit();
			close();
			return aua;
		}
		catch(HibernateException he){
			rollback();
			throw new AdopterException("Error "+he.getMessage());
		}
	}
	
	public Adopter getAdopter(AdopterUserAccount aua) throws AdopterException {
		AdopterUserAccount account = aua;
		String email = aua.getAdopterEmail();
		begin();
		Query q = getSession().createQuery("from Adopter where email = :adopteremail");
		q.setString("adopteremail", email);
		Adopter a = (Adopter) q.uniqueResult();
		System.out.println(aua.getAdopterEmail());
		System.out.println(aua.getPassword());
		aua.setAdopter(a);
		commit();
		close();
		return a;
	}
	
	public Adopter getAdopterByEmail(String email) throws AdopterException {
		begin();
		Query q = getSession().createQuery("from Adopter where email = :email");
		q.setString("email", email);
		Adopter a = (Adopter) q.uniqueResult();
		commit();
		close();
		return a;
	}
	
	public boolean isAdopterEmailValid(String email) throws AdopterException{
		try{
			begin();
			Query q = getSession().createQuery("from AdopterUserAccount where adopteremail = :adopteremail");
			q.setString("adopteremail", email);
			AdopterUserAccount aua = (AdopterUserAccount) q.uniqueResult();
			commit();
			close();
			if(aua == null) {
				return true;
			}
			else {
				return false;
			}
			
		}
		catch(HibernateException he){
			rollback();
			throw new AdopterException("isAdopterEmailValid: "+he.getMessage());
		}
	}
	
	public boolean checkIfAdopterUserAccountPasswordIsRight(long adopteremail, String password) throws EmployeeException {
		try{
			begin();
			Session session = getSession();
			Query q = getSession().createQuery("from EmployeeUserAccount where adopteremail = :adopteremail");
			q.setLong("adopteremail", adopteremail);
			AdopterUserAccount aua = (AdopterUserAccount) q.uniqueResult();
			commit();
			close();
			if(aua.getPassword().equals(password)) {
				return true;
			}
			else {
				return false;
			}
		}
		catch(HibernateException he) {
			rollback();
			throw new EmployeeException("checkIfEmployeeUserAccountPasswordIsRight: " + he.getMessage());
		}
	}
	
	public void updateAdopter(String email, String phone, String address) throws AdopterException {
		try{
			begin();
			Session session = getSession();
			//Query q = getSession().createQuery("from adopter_table where email = :email");
			
			Query q = getSession().createQuery("update Adopter a set a.phone = :phone where a.email = :email");
			q.setString("email", email);
			q.setString("phone", phone);
			q.executeUpdate();
			
			q = getSession().createQuery("update Adopter a set a.address = :address where a.email = :email");
			q.setString("email", email);
			q.setString("address", address);
			q.executeUpdate();
			
			commit();
			close();
		}
		catch(HibernateException he) {
			rollback();
			throw new AdopterException("Cannot update adopter: " + he.getMessage());
		}
	}
	
	
//--------------------------------------------------------------------------------------------------------
	
	
	public Employee addEmployee(long employeeid, String password, String name, String role) throws AdopterException{
		try{
			
			EmployeeUserAccount eua = new EmployeeUserAccount();
			Employee employee = new Employee();
			begin();
			
			//employee.setEmployeeId(employeeid);
			employee.setName(name);
			employee.setRole(role);
			employee.setAccount(eua);
			Session session = getSession();
			session.save(employee);
			commit();
			close();
			
			begin();
			eua.setEmployee(employee);
			eua.setPassword(password);
			session = getSession();
			session.save(eua);
			System.out.println(eua.getEmployeeid());
			System.out.println(eua.getPassword());
			commit();
			close();
			
			return employee;
		}
		catch(HibernateException he){
			rollback();
			throw new AdopterException("Error:"+he.getMessage());
		}
	}
	
	
	
	public EmployeeUserAccount getEmployeeUserAccount(long employeeid, String password) throws EmployeeException {
		try{
			begin();
			Query q = getSession().createQuery("from EmployeeUserAccount where employeeId = :employeeid and password= :password");
			q.setLong("employeeid", employeeid);
			q.setString("password", password);
			EmployeeUserAccount eua = (EmployeeUserAccount) q.uniqueResult();
			commit();
			close();
			System.out.println(eua.getPassword());
			return eua;
		}
		catch(HibernateException he){
			rollback();
			throw new EmployeeException("Cannot get employee user account: "+he.getMessage());
		}
	}
	
	public Employee getEmployee(EmployeeUserAccount eua) throws EmployeeException {
		try{
			long employeeid = eua.getEmployeeid();
			begin();
			Query q = getSession().createQuery("from Employee where employeeId = :employeeid");
			q.setLong("employeeid", employeeid);
			Employee e = (Employee) q.uniqueResult();
			eua.setEmployee(e);
			e.setAccount(eua);
			System.out.println(e.getEmployeeId());
			System.out.println(e.getRole());
			commit();
			close();
			return e;
		}
		catch(HibernateException he){
			rollback();
			throw new EmployeeException("Cannot get employee: "+he.getMessage());
		}
	}
	
	public Employee getEmployeeByID(long id) throws EmployeeException {
		try{
			begin();
			Query q = getSession().createQuery("from Employee where employeeId = :id");
			q.setLong("id", id);
			Employee e = (Employee) q.uniqueResult();
			commit();
			close();
			return e;
		}
		catch(HibernateException he){
			rollback();
			throw new EmployeeException("Cannot get employee: "+he.getMessage());
		}
	}
	
	public boolean checkIfEmployeeUserAccountPasswordIsRight(long employeeid, String password) throws EmployeeException {
		try{
			begin();
			Session session = getSession();
			Query q = getSession().createQuery("from EmployeeUserAccount where employeeId = :employeeid");
			q.setLong("employeeid", employeeid);
			EmployeeUserAccount eua = (EmployeeUserAccount) q.uniqueResult();
			commit();
			close();
			if(eua.getPassword().equals(password)) {
				return true;
			}
			else {
				return false;
			}
		}
		catch(HibernateException he) {
			rollback();
			throw new EmployeeException("checkIfEmployeeUserAccountPasswordIsRight: " + he.getMessage());
		}
	}
	
	public void updateEmployeeUserAccount(long employeeid, String password) throws EmployeeException {
		try{
			begin();
			Session session = getSession();
			Query q = getSession().createQuery("update EmployeeUserAccount a set a.password = :password where a.employeeId = :employeeid");
			q.setLong("employeeid", employeeid);
			q.setString("password", password);
			q.executeUpdate();
			
			commit();
			close();
		}
		catch(HibernateException he) {
			rollback();
			throw new EmployeeException("Cannot update adopter: " + he.getMessage());
		}
	}
	
}
