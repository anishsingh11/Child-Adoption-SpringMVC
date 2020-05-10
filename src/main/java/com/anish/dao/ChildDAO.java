package com.anish.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.anish.exception.ChildException;
import com.anish.pojo.Child;

public class ChildDAO extends DAO {
	public void addChild(Child child) throws ChildException{
		try{
			begin();
			Child a = child;
			Session session = getSession();
			session.save(a);
			commit();
			close();
		}
		catch(HibernateException he){
			rollback();
			throw new ChildException("Error:"+he.getMessage());
		}
	}
	
	public List<Child> getChildList() throws ChildException{
		try{
			begin();
			Query q = getSession().createQuery("from Child");
			//q.setString("title", '%'+title+'%');
			List<Child> result = q.list();
			commit();
			close();
			System.out.println("size: " + result.size());
			return result;
		}
		catch(HibernateException he)	{
			rollback();
			throw new ChildException("Cannot list children: " + he.getMessage());
		}
	}
	
	public Child getChildById(long id) throws ChildException{
		try{
			begin();
			Query q = getSession().createQuery("from Child where childid = :id");
			q.setLong("id", id);
                        
			Child a = (Child) q.uniqueResult();
			commit();
			close();
			return a;
			
		}
		catch(HibernateException he){
			rollback();
			throw new ChildException("getChildById: "+he.getMessage());
		}
	}

	public List<Child> getAdopterChildAdoptionList() throws ChildException{
		try{
			begin();
			Query q = getSession().createQuery("from Child where status = :status");
			q.setString("status", "treated");
			List<Child> result = q.list();
			commit();
			close();
			return result;
		}
		catch(HibernateException he)	{
			rollback();
			throw new ChildException("Cannot list children: " + he.getMessage());
		}
	}
	
	public void updateChild(long childId, String status) throws ChildException {
		try{
			begin();
			Session session = getSession();
			
			Query q = getSession().createQuery("update Child a set a.status = :status where a.childId = :childId");
			q.setLong("childId", childId);
			q.setString("status", status);
			q.executeUpdate();
			commit();
			close();
		}
		catch(HibernateException he)	{
			rollback();
			throw new ChildException("Cannot update child: " + he.getMessage());
		}
	}
	
	public float getTotalCount() throws ChildException{
		begin();
		Session session = getSession();
		Query q = getSession().createQuery("from Child");
		List<Child> result = q.list();
		commit();
		close();
		return result.size();
	}
	        
        public float getAge1Percentage() throws ChildException{
            begin();
            int age = 5;
		Session session = getSession();
		Query q = getSession().createQuery("from Child where age< :age");
		q.setInteger("age", age);
		List<Child> result = q.list();
		commit();
		close();
		float ageCount= result.size();
		float total = this.getTotalCount();
		if(total == 0) {
			return 0;
		}
		else {
			return ageCount;
		}
        }
        
        public float getAge2Percentage() throws ChildException{
            begin();
            
		Session session = getSession();
		Query q = getSession().createQuery("from Child where age>= :age1 and age< :age2");
		q.setInteger("age1", 5);
                q.setInteger("age2", 10);
		List<Child> result = q.list();
		commit();
		close();
		float ageCount= result.size();
		float total = this.getTotalCount();
		if(total == 0) {
			return 0;
		}
		else {
			return ageCount;
		}
        }
	
	
	public float getOtherPercentage() throws ChildException{
		begin();
		Session session = getSession();
		Query q = getSession().createQuery("from Child where age>= :age");
		q.setInteger("age", 10);
		List<Child> result1 = q.list();
		commit();
		close();
		
		float otherCount= result1.size();
		return otherCount;
	}
	
	public float getMalePercentage() throws ChildException{
		begin();
		Session session = getSession();
		Criteria crit = session.createCriteria(Child.class);
		crit.add(Restrictions.ilike("gender", "m", MatchMode.START));
		List<Child> result = crit.list();
		commit();
		close();
		return result.size();
	}
	
	public float getFemalePercentage() throws ChildException{
		begin();
		Session session = getSession();
		Criteria crit = session.createCriteria(Child.class);
		crit.add(Restrictions.ilike("gender", "f", MatchMode.START));
		List<Child> result = crit.list();
		commit();
		close();
		return result.size();
	}
}
