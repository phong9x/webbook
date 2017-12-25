package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.BookEntity;
import org.trams.webbook.bean.jpa.CommentEntity;

/**
 * Repository : Book.
 */
public interface BookJpaRepository extends PagingAndSortingRepository<BookEntity, Integer> {
	@Query(
			"Select u From BookEntity u where u.isDelete!=1"
			)
	Page<BookEntity> listPaging(Pageable pageable);	
	
	@Query(
			"Select u From BookEntity u where u.user.id=?1 and u.isDelete!=1"
			)
	Page<BookEntity> listMyBoook(Integer userid,Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where u.genreName like ?1 and u.ageGroupName like ?2 and  u.leagueName like ?3  and u.adult like ?4 and u.user.nickname like ?5 and u.title like ?6  and u.isDelete!=1"
			)
	Page<BookEntity> listPagingSearchAll(String genreId,String ageGroup,String league,String adult,String userNickname,String title,Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where u.genreName like ?1 and u.ageGroupName like ?2 and  u.leagueName like ?3 and u.comeplete = 1 and u.adult like ?4 and u.user.nickname like ?5 and u.title like ?6  and u.isDelete!=1"
			)
	Page<BookEntity> listPagingSearchBookComplete(String genre,String ageGroup,String league, String adult,String userNickname,String title,Pageable pageable);
	
	@Query(
			value="Select count(*) From book c ",nativeQuery = true
			)
	Integer totalBook();
	
	@Query(
			value="Select count(*) From book c where (SELECT DATEDIFF(CURDATE(),c.CREATE_DATE) AS DiffDate) <=7",nativeQuery = true
			)
	Integer totalNewBook();
	
	@Query(
			"Select u From BookEntity u where u.ageGroupId = ?1 and u.leagueId = ?2 and u.isDelete!=1 and u.adult!='성인'"
			)
	Page<BookEntity> searchBook(Integer age, Integer leafue,Pageable pageable);
	@Query(
			"Select u From BookEntity u where u.leagueId = ?1 and u.isDelete!=1 and u.adult!='성인'"
			)
	Page<BookEntity> searchBook(Integer leafue,Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where u.leagueId = ?1 and u.dayOfWeek like ?2 and u.isDelete!=1"
			)
	Page<BookEntity> searchByAuthorLevel(Integer authorLevel,String time,Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where u.dayOfWeek like ?1 and u.genreName like ?2 and u.adult like ?3 and u.leagueId = ?4 and u.isDelete!=1"
			)
	Page<BookEntity> searchOfficalAuthorBy_Time_Author_Gender(String time, String genre, String adult,Integer leagueName,Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where u.dayOfWeek like ?1 and u.genreName like ?2 and u.adult like?3 and u.comeplete = ?4 and u.leagueId = ?5 and u.isDelete!=1"
			)
	Page<BookEntity> searchOfficalAuthorBy_Time_Author_Gender_Complete(String time, String genre, String adult, Integer complete,Integer leagueName,Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where u.dayOfWeek like ?1 and u.genreName like ?2 and u.adult like?3 and u.comeplete = ?4 and u.isDelete!=1"
			)
	Page<BookEntity> searchBy_Time_Author_Gender_Complete(String time, String genre, String adult, Integer complete,Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where u.dayOfWeek like ?1 and u.genreName like ?2 and u.adult like ?3 and u.leagueName like ?4  and u.isDelete!=1"
			)
	Page<BookEntity> searchBy_Time_Author_Gender(String time, String genre, String adult, String league, Pageable pageable);
	
	
	
	@Query(
			"Select u From BookEntity u where u.leagueId = ?1 and u.title like ?2 and u.isDelete!=1"
			)
	Page<BookEntity> searchBookBy_LeagueName_Title(Integer leagueId,String title,Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where u.title like ?1 and u.leagueId = ?2 and u.isDelete!=1"
			)
	Page<BookEntity> searchBookBy_Title(String title,Integer leagueId, Pageable pageable);
	
	
	@Query(
			"Select u From BookEntity u where u.title like ?1 and u.isDelete!=1"
			)
	Page<BookEntity> searchOfficalAuthor(String title,Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where u.leagueId = ?1 and u.genreId=?2 and u.comeplete=?3 and u.adult=?4 and u.dayOfWeek like ?5 and u.isDelete!=1"
			)
	Page<BookEntity> searchOfficalAuthor(Integer authorLevel,Integer genre,Integer complate, String adult,String time,Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where  u.leagueId = ?1 and u.adult =?2 and u.dayOfWeek like ?3 and u.isDelete!=1"
			)
	Page<BookEntity> searchOfficalAuthorAdult(Integer authorLevel, String adult,String time,Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where u.leagueId = ?1 and u.comeplete=?2 and u.adult like ?3 and u.dayOfWeek like ?4 and u.isDelete!=1"
			)
	Page<BookEntity> searchOfficalAuthorComplate(Integer authorLevel,Integer complate, String adult,String time,Pageable pageable);
	@Modifying
	@Query(
			value="Update book set IS_DELETE=1 where _id=?1",nativeQuery = true
			)
	 void delete(Integer id);
	
	@Query(
			"Select u From CommentEntity u where u.reportNumber > 0 and u.typeKey = ?1 and u.isDelete = 0"
			)
	Page<CommentEntity> listCommentReport(String typekey, Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where u.leagueId=?1 and u.isDelete!=1 and u.adult!='성인'"
			)
	Page<BookEntity> list_15_Book_Weekly_Hit(Integer leagueId,Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where u.leagueId=27 and u.isDelete!=1 and u.adult!='성인'"
			)
	Page<BookEntity> list_Best_League(Pageable pageable);
	
	@Query(
			"Select u From BookEntity u where u.leagueId=?1 and u.ageGroupId=?2 and u.isDelete!=1 and u.adult!='성인' "
			)
	Page<BookEntity> list_Weekly_By_AgeGroup_League(Integer leagueId,Integer ageGroupId,Pageable pageable);
	
	@Modifying
	@Query(
			value="Update book set HITS_WEEKLY=0,INTERESTED_WEEKLY=0,RECOMMENDATION_WEEKLY=0 where HITS_WEEKLY>0 or INTERESTED_WEEKLY>0 or RECOMMENDATION_WEEKLY>0 and IS_DELETE=0",nativeQuery = true
			)
	 void update_Weekly_Book();
	
	
	
	
}
