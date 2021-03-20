package edu.group6.capston.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class GooglePojo {
	  private String id;
	  private String email;
	  private boolean verified_email;
	  private String name;
	  private String given_name;
	  private String family_name;
	  private String link;
	  private String picture;
	  private String hd;
	  // getter-setter
}