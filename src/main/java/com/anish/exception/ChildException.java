package com.anish.exception;

public class ChildException extends Exception{
	public ChildException(String message)	{
		super("ChildException- "+message);
	}
	public ChildException(String message, Throwable cause){
		super("ChildException- "+message, cause);
	}
}
