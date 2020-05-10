package com.anish.exception;

public class TreatmentRecordException extends Exception {
	public TreatmentRecordException(String message)	{
		super("TreatmentRecordException- "+message);
	}
	public TreatmentRecordException(String message, Throwable cause){
		super("TreatmentRecordException- "+message, cause);
	}
}
