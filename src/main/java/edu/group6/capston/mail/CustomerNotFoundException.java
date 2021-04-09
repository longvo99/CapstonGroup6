package edu.group6.capston.mail;

public class CustomerNotFoundException extends Exception {
	public CustomerNotFoundException(String errorMessage) {
		super(errorMessage);
	}
}