package com.anish.exception;

public class EmployeeUserAccountException extends Exception{
	public EmployeeUserAccountException(String message)	{
		super("EmployeeUserAccountException- "+message);
	}
	public EmployeeUserAccountException(String message, Throwable cause){
		super("EmployeeUserAccountException- "+message, cause);
	}
}
