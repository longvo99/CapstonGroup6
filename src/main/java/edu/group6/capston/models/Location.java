package edu.group6.capston.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Location")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Location{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int locationId;
	@Column
	private String locationName;
	@Column
	private String locationPhone;
	@Column
	private String locationEmail;
	@Column
	private String country;
	@Column
	private String city;
	@Column
	private String district;
	@Column
	private String ward;
	@Column
	private String address;
	@Column
	private String mediaPath;
	@Column
	private String openTime;
	@Column
	private String closeTime;
	@Column
	private int reviewCount;
	@ManyToOne
	@JoinColumn(name = "CategoryId")
	private LocationCategory locationCategory;
	@ManyToOne
	@JoinColumn(name = "locationTypeId")
	private LocationType locationType;
	@ManyToOne
	@JoinColumn(name = "userId")
	private Users users;
	public Location(int locationId) {
		super();
		this.locationId = locationId;
	}
<<<<<<< Updated upstream
=======
	
>>>>>>> Stashed changes
}
