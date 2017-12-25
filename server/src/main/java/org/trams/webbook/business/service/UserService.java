/*
 * Created on 15 Dec 2015 ( Time 17:20:40 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.business.service;

import java.util.List;

import org.trams.webbook.bean.jpa.UserEntity;
import org.trams.webbook.web.item.StatisticMember;
import org.trams.webbook.bean.User;
import org.springframework.data.domain.Page;

/**
 * Business Service Interface for entity User.
 */
public interface UserService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	User findById( Integer id  ) ;

	/** 
	 * Loads all entities.
	 * @return all entities
	 */
	List<User> findAll();
	
	/**
	 * Loads entities in page number.
	 * @return entities
	 */

	Page<UserEntity> findAll(Integer page);

	/**
	 * Count all entities
	 * @return Long
	 */
	Long countTotal();
	

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	User save(User entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	User update(User entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	User create(User entity);
	
	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );
	
	Page<UserEntity> listPaging(Integer page,Integer size);

	UserEntity login(String username,String password, Integer role);
	
	List<UserEntity> checkNickname(String nickname);
	
	List<UserEntity> checkUsername(String username);
	
	UserEntity findByUsernameFullnameEmail(String username,String fullname,String email);
	
	List<UserEntity> findByFullnameEmail(String fullname,String email);
	
	Integer totalNumberMember();
	
	Integer totalNewlyJoinedMember();
	
	Integer totalVisitorMember();
	
	Integer totalTodayVisitorMember();
	
	Integer totalMemberByGender(String gender);
	
	Integer totalMemberRegisterBook();
	
	Integer totalMemberRegisterBookNewly();
	
	Integer totalMemberByAgeGroup(Integer ageGroup, String group);
	
	StatisticMember calculateMember();
	
	Page<UserEntity> listPagingSearch(String ageGroupName, String authorName, String username, String nickname, String fullname, Integer page, Integer size);

	
	List<Integer> reportMember12Month(Integer current_month,Integer current_year);
	
	List<Integer> reportMember_WithRaw_Number_By_12Month(Integer current_month,Integer current_year);
	
	List<Integer> reportMember_Active_Number_By_12Month(Integer current_month,Integer current_year);
	
	List<Integer> report_Conversion_Rate_By_12Month(Integer current_month,Integer current_year);
	
	List<Integer> reportMember_Charge_Number_By_12Month(Integer current_month,Integer current_year);
	
	List<Integer> reportMember_Coupon_Charge_Total_By_12Month(Integer current_month,Integer current_year);
	
	void updateVisitorDaily();
}
