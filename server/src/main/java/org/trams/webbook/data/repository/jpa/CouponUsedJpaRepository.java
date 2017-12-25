package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.CouponUsedEntity;
import org.trams.webbook.bean.jpa.PostEntity;

/**
 * Repository : CouponUsed.
 */
public interface CouponUsedJpaRepository extends PagingAndSortingRepository<CouponUsedEntity, Integer> {
	@Query(
			"Select u From CouponUsedEntity u where  u.isDelete!=1 "
			)
	Page<CouponUsedEntity> listPaging(Pageable pageable);
	
	@Query(
			"Select u From CouponUsedEntity u where u.book.user.id=?1 and MONTH(u.createDate)=?2 and YEAR(u.createDate)=?3 and  u.isDelete!=1 "
			)
	Page<CouponUsedEntity> listPagingBy_AuthorId_Month_Year(Integer userid,Integer month, Integer year,Pageable pageable);
	@Transactional
	@Query(
			value="select e._id,b.TITLE as book_title,e.TITLE, e.PRICE,count(c._id), e.RATIO from episode e inner join coupon_used c on (e._id=c.EPISODE_ID) inner join book b on e.BOOK_ID=b._id"
					+ " where b.USER_ID=?1 and month(c.CREATE_DATE)=?2 and year(c.CREATE_DATE)=?3"
					+ " group by e._id order by e._id ASC limit ?4,?5",nativeQuery = true
			)
	List<Object[]> listBy_AuthorId_Month_Year(Integer userid,Integer month, Integer year,int begin, int end);
	
	@Query(
			value="select  count(e._id) from episode e  inner join book b on e.BOOK_ID=b._id"
					+ " where e._id in (select c.EPISODE_ID from coupon_used c where month(c.CREATE_DATE)=?2 and year(c.CREATE_DATE)=?3) and b.USER_ID=?1"
					,nativeQuery = true
			)
	Integer totalPageBy_AuthorId_Month_Year(Integer userid,Integer month, Integer year);
	
	
	
	@Query(
			value="Select sum(c.CHARGE_AMOUNT) from coupon_used c where c.USER_ID = ?1 and c.IS_DELETE = 0",nativeQuery = true
			)
	Integer totalChargeAmountBy_UserId(Integer userid);
	
	@Query(
			"Select u From CouponUsedEntity u where  u.isDelete!=1 and u.user.id=?1"
			)
	List<CouponUsedEntity> listBy_UserId(Integer userId);
	
	@Query(
			"Select u From CouponUsedEntity u where u.isDelete!=1 and u.user.id=?1 and u.episode.id=?2 "
			)
	List<CouponUsedEntity> findBy_UserId_EpisodeId(Integer userId, Integer episodeId);
	
	@Query(
			"Select u From CouponUsedEntity u where u.isDelete!=1 and u.user.id=?1 and u.book.id=?2 "
			)
	List<CouponUsedEntity> findBy_UserId_BookId(Integer userId, Integer bookId);
	
	@Query(
			"Select u From CouponUsedEntity u Where u.user.username like ?1 and u.user.fullname like ?2 and u.isDelete = 0"
			)
	Page<CouponUsedEntity> listPagingSearch(String id, String nickname, Pageable pageable);
	
	@Query(
			"Select u From CouponUsedEntity u Where u.user.username like ?1 and u.user.fullname like ?2 and u.book.genreName like ?3 and u.episode.title like ?4 and u.isDelete = 0"
			)
	Page<CouponUsedEntity> listPagingSearchSales(String id, String name, String bookname, String episodename,  Pageable pageable);
	
	
	
	@Query(
			value="Select sum(c.CHARGE_AMOUNT) From coupon_used c where c.CREATE_DATE >= ?1 and c.CREATE_DATE <= ?2 and c.IS_DELETE = 0",nativeQuery = true
			)
	Integer totalCouponChargingAmount(Date from, Date to);
	
	@Query(
			value="Select sum(c.CHARGE_AMOUNT) From coupon_purchase c where c.CREATE_DATE >= ?1 and c.CREATE_DATE <= ?2 and c.IS_DELETE = 0",nativeQuery = true
			)
	Integer totalCouponUser(Date from, Date to);
	
	@Query(
			value="Select sum(c.CHARGE_AMOUNT) From coupon_used c where YEAR(c.CREATE_DATE) = ?1 and MONTH(c.CREATE_DATE) = ?2 and c.IS_DELETE = 0",nativeQuery = true
			)
	Integer totalPriceCoupon(Integer year, Integer month);
	
	@Query(
			value="Select sum(c.CHARGE_AMOUNT) From coupon_used c and c.USER_ID = ?1 and c.IS_DELETE = 0",nativeQuery = true
			)
	Integer totalSumAmountUser(Integer year, Integer month);
	
	
}
