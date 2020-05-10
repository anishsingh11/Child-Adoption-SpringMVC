package com.anish.exception;

public class AdopterUserAccountException extends Exception{
	public AdopterUserAccountException(String message)	{
		super("AdopterUserAccountException- "+message);
	}
	public AdopterUserAccountException(String message, Throwable cause){
		super("AdopterUserAccountException- "+message, cause);
	}
}
