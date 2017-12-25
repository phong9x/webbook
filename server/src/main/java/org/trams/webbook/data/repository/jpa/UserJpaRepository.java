package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.CategoryEntity;
import org.trams.webbook.bean.jpa.UserEntity;

/**
 * Repository : User.
 */
public interface UserJpaRepository extends PagingAndSortingRepository<UserEntity, Integer> {
	@Query(
			"Select u From UserEntity u where u.role=0 and u.isDelete = 0 "
			)
	Page<UserEntity> listPaging(Pageable pageable);
	
	@Query(
			"Select u From UserEntity u Where u.username = ?1 and u.password = ?2 and u.role = ?3  and u.isDelete = 0"
			)
	UserEntity login(String username,String password, Integer role);
	
	@Query(
			"Select u From UserEntity u Where u.nickname like ?1 and u.isDelete = 0"
			)
	List<UserEntity> checkNickname(String username);
	
	@Query(
			"Select u From UserEntity u Where u.username like ?1 and u.isDelete = 0"
			)
	List<UserEntity> checkUsername(String username);
	
	@Query(
			"Select u From UserEntity u Where u.username = ?1 and u.fullname = ?2 and u.email = ?3 and u.isDelete = 0"
			)

	UserEntity findByUsernameFullnameEmail(String username,String fullname,String email);
	
	@Query(
			"Select u From UserEntity u Where u.fullname like ?1 and u.email like ?2 and u.isDelete = 0"
			)
	List<UserEntity> findByFullnameEmail(String fullname,String email);
	
	@Query(
			value="Select count(*) From user where IS_DELETE = 0",nativeQuery = true
			)
	Integer totalNumberMember();
	
	@Query(
			value="Select count(*) From user u where SELECT DATEDIFF(CURDATE(),u.CREATE_DATE) AS DiffDate) <=7",nativeQuery = true
			)
	Integer totalNewlyJoinedMember();
	
	@Query(
			value="Select total_visitor From visitor ",nativeQuery = true
			)
	Integer totalVisitorMember();
	
	@Query(
			value="Select today_visitor From visitor ",nativeQuery = true
			)
	Integer totalTodayVisitorMember();
	
	@Query(
			value="Select count(*) From user u where u.GENDER like ?1 ",nativeQuery = true
			)
	Integer totalMemberByGender(String gender);
	
	@Query(
			value="Select count(*) From user u where u.AGE_GROUP_ID = ?1 and u.GENDER like ?2",nativeQuery = true
			)
	Integer totalMemberByAgeGroup(Integer ageGroup, String gender);
	
	@Query(
			value="Select count(*) From user u where u._id in (select b._id from book b)",nativeQuery = true
			)
	Integer totalMemberRegisterBook();
	
	@Query(
			value="Select count(*) From user u where u._id in (select b._id from book b where (SELECT DATEDIFF(CURDATE(),u.CREATE_DATE) AS DiffDate) <=7)",nativeQuery = true
			)
	Integer totalMemberRegisterBookNewly();
	@Query(
			"Select u From UserEntity u where u.role=0 and u.isDelete = 0 and u.ageGroupName like ?1 and u.authorName like ?2 and u.username like ?3 and u.nickname like ?4 and u.fullname like ?5"
			)
	Page<UserEntity> listPagingSearch(String ageGroupName, String authorName, String username, String nickname,String fullname, Pageable pageable);
	
	@Query(
			value="SELECT "
					+ "count(case when month(u.CREATE_DATE)=1 then u._id end) As Month1,"
					+ "count(case when month(u.CREATE_DATE)=2 then u._id end) As Month2,"
					+ "count(case when month(u.CREATE_DATE)=3 then u._id end) As Month3,"
					+ "count(case when month(u.CREATE_DATE)=4 then u._id end) As Month4,"
					+ "count(case when month(u.CREATE_DATE)=5 then u._id end) As Month5,"
					+ "count(case when month(u.CREATE_DATE)=6 then u._id end) As Month6,"
					+ "count(case when month(u.CREATE_DATE)=7 then u._id end) As Month7,"
					+ "count(case when month(u.CREATE_DATE)=8 then u._id end) As Month8,"
					+ "count(case when month(u.CREATE_DATE)=9 then u._id end) As Month9,"
					+ "count(case when month(u.CREATE_DATE)=10 then u._id end) As Month10,"
					+ "count(case when month(u.CREATE_DATE)=11 then u._id end) As Month11,"
					+ "count(case when month(u.CREATE_DATE)=12 then u._id end) As Month12 "
					+ "FROM user u "
					+ "where Year(u.CREATE_DATE) =?1 and u.IS_DELETE=0 ",nativeQuery = true
			)
	List<Object[]> reportMember_Number_By_12Month(Integer year);
	
	@Query(
			value="SELECT "
					+ "count(case when month(u.CREATE_DATE)=1 then u._id end) As Month1,"
					+ "count(case when month(u.CREATE_DATE)=2 then u._id end) As Month2,"
					+ "count(case when month(u.CREATE_DATE)=3 then u._id end) As Month3,"
					+ "count(case when month(u.CREATE_DATE)=4 then u._id end) As Month4,"
					+ "count(case when month(u.CREATE_DATE)=5 then u._id end) As Month5,"
					+ "count(case when month(u.CREATE_DATE)=6 then u._id end) As Month6,"
					+ "count(case when month(u.CREATE_DATE)=7 then u._id end) As Month7,"
					+ "count(case when month(u.CREATE_DATE)=8 then u._id end) As Month8,"
					+ "count(case when month(u.CREATE_DATE)=9 then u._id end) As Month9,"
					+ "count(case when month(u.CREATE_DATE)=10 then u._id end) As Month10,"
					+ "count(case when month(u.CREATE_DATE)=11 then u._id end) As Month11,"
					+ "count(case when month(u.CREATE_DATE)=12 then u._id end) As Month12 "
					+ "FROM user u "
					+ "where Year(u.CREATE_DATE) =?1 and u.IS_DELETE=1 and u.ACTIVE = 0",nativeQuery = true
			)
	List<Object[]> reportMember_WithRaw_Number_By_12Month(Integer year);
	
	@Query(
			value="SELECT "
					+ "count(case when month(u.CREATE_DATE)=1 then u._id end) As Month1,"
					+ "count(case when month(u.CREATE_DATE)=2 then u._id end) As Month2,"
					+ "count(case when month(u.CREATE_DATE)=3 then u._id end) As Month3,"
					+ "count(case when month(u.CREATE_DATE)=4 then u._id end) As Month4,"
					+ "count(case when month(u.CREATE_DATE)=5 then u._id end) As Month5,"
					+ "count(case when month(u.CREATE_DATE)=6 then u._id end) As Month6,"
					+ "count(case when month(u.CREATE_DATE)=7 then u._id end) As Month7,"
					+ "count(case when month(u.CREATE_DATE)=8 then u._id end) As Month8,"
					+ "count(case when month(u.CREATE_DATE)=9 then u._id end) As Month9,"
					+ "count(case when month(u.CREATE_DATE)=10 then u._id end) As Month10,"
					+ "count(case when month(u.CREATE_DATE)=11 then u._id end) As Month11,"
					+ "count(case when month(u.CREATE_DATE)=12 then u._id end) As Month12 "
					+ "FROM user u "
					+ "where Year(u.CREATE_DATE) =?1 and IS_DELETE=0 and ACTIVE = 1",nativeQuery = true
			)
	List<Object[]> reportMember_Active_Number_By_12Month(Integer year);
	
	@Query(
			value="SELECT "
					+ "count(DISTINCT case when month(u.CREATE_DATE)=1 then u.user_id end) As Month1,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=2 then u.user_id end) As Month2,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=3 then u.user_id end) As Month3,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=4 then u.user_id end) As Month4,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=5 then u.user_id end) As Month5,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=6 then u.user_id end) As Month6,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=7 then u.user_id end) As Month7,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=8 then u.user_id end) As Month8,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=9 then u.user_id end) As Month9,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=10 then u.user_id end) As Month10,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=11 then u.user_id end) As Month11,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=12 then u.user_id end) As Month12 "
					+ "FROM coupon_used u "
					+ "where Year(u.CREATE_DATE) =?1 and u.IS_DELETE=0",nativeQuery = true
			)
	List<Object[]> reportMember_Charge_Number_By_12Month(Integer year);
	
	@Query(
			value="SELECT "
					+ "count(DISTINCT case when month(u.CREATE_DATE)=1 then u.user_id end) As Month1,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=2 then u.user_id end) As Month2,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=3 then u.user_id end) As Month3,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=4 then u.user_id end) As Month4,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=5 then u.user_id end) As Month5,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=6 then u.user_id end) As Month6,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=7 then u.user_id end) As Month7,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=8 then u.user_id end) As Month8,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=9 then u.user_id end) As Month9,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=10 then u.user_id end) As Month10,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=11 then u.user_id end) As Month11,"
					+ "count(DISTINCT case when month(u.CREATE_DATE)=12 then u.user_id end) As Month12 "
					+ "FROM coupon_used u "
					+ "where Year(u.CREATE_DATE) =?1 and u.IS_DELETE=0",nativeQuery = true
			)
	List<Object[]> reportMember_Coupon_Charge_Total_By_12Month(Integer year);
	@Modifying
	@Query(
			value="Update visitor set today_visitor=0",nativeQuery = true
			)
	void updateVisitorDaily();
}
