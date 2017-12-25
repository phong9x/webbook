package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.CouponPurchaseEntity;
import org.trams.webbook.bean.jpa.CouponUsedEntity;

/**
 * Repository : CouponPurchase.
 */
public interface CouponPurchaseJpaRepository extends PagingAndSortingRepository<CouponPurchaseEntity, Integer> {
	@Query(
			"Select u From CouponPurchaseEntity u where u.isDelete = 0"
			)
	Page<CouponPurchaseEntity> listPaging(Pageable pageable);
	
	@Query(
			"Select u From CouponPurchaseEntity u where u.isDelete = 0 and u.user.id=?1 "
			)
	List<CouponPurchaseEntity> listByUserId(Integer userid);
	
	@Query(
			"Select u From CouponPurchaseEntity u where u.user.id=?1 and u.status=-1 and  u.isDelete=1 "
			)
	Page<CouponPurchaseEntity> listPagingBy_UserId_Refund(Integer userid, Pageable pageable);
	
	@Query(
			value="Select count(*) From coupon_purchase where IS_DELETE=0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCouponChargingNumber();
	
	@Query(
			value="Select count(*) From coupon_purchase c where c.IS_DELETE=0 and (SELECT DATEDIFF(CURDATE(),c.CREATE_DATE) AS DiffDate) <=7 and c.STATUS=1",nativeQuery = true
			)
	Integer totalRecentCouponChargingNumber();
	
	@Query(
			value="Select sum(c.CHARGE_AMOUNT) From coupon_purchase c where c.IS_DELETE=0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCouponChargingAmount();
	
	@Query(
			value="Select sum(c.CHARGE_AMOUNT) From coupon_purchase c where c.IS_DELETE=0 and (SELECT DATEDIFF(CURDATE(),c.CREATE_DATE) AS DiffDate) <=7 and c.STATUS=1",nativeQuery = true
			)
	Integer totalRecentCouponChargingAmount();
	
	@Query(
			"Select u From CouponPurchaseEntity u Where u.user.username like ?1 and u.user.fullname like ?2 and u.isDelete = 0"
			)
	Page<CouponPurchaseEntity> listPagingSearch(String id, String nickname, Pageable pageable);
	
	@Query(
			"Select u From CouponPurchaseEntity u Where u.user.username like ?1 and u.user.fullname like ?2 and u.createDate>=?3 and u.createDate<=?4 and  u.isDelete = 0"
			)
	Page<CouponPurchaseEntity> listPagingSearch_ByTime(String id, String nickname,Date from,Date to, Pageable pageable);
	
	@Query(
			value="Select sum(c.TOTAL_FEE) From coupon_purchase c where c.CREATE_DATE >= ?1 and c.CREATE_DATE <= ?2 and c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalChargeAmount(Date from, Date to);
	
	@Query(
			value="Select count(DISTINCT c.USER_ID) From coupon_purchase c where c.CREATE_DATE >= ?1 and c.CREATE_DATE <= ?2 and c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCountUserID(Date from, Date to);
	
	
	@Query(
			value="Select sum(c.TOTAL_FEE) From coupon_purchase c where c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalChargeAmount();
	
	@Query(
			value="Select count(DISTINCT c.USER_ID) From coupon_purchase c where c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCountUserID();
	
	
	@Query(
			value="Select count(c._id) From coupon_purchase c where c.CREATE_DATE >= ?1 and c.CREATE_DATE <= ?2 and c.TOTAL_FEE = 3000 and c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCount3000(Date from, Date to);
	
	@Query(
			value="Select count(c._id) From coupon_purchase c where c.CREATE_DATE >= ?1 and c.CREATE_DATE <= ?2 and c.TOTAL_FEE = 5000 and c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCount5000(Date from, Date to);
	
	@Query(
			value="Select count(c._id) From coupon_purchase c where c.CREATE_DATE >= ?1 and c.CREATE_DATE <= ?2 and c.TOTAL_FEE = 10000 and c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCount10000(Date from, Date to);
	
	@Query(
			value="Select count(c._id) From coupon_purchase c where c.CREATE_DATE >= ?1 and c.CREATE_DATE <= ?2 and c.TOTAL_FEE = 30000 and c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCount30000(Date from, Date to);
	
	@Query(
			value="Select count(c._id) From coupon_purchase c where c.CREATE_DATE >= ?1 and c.CREATE_DATE <= ?2 and c.TOTAL_FEE = 50000 and c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCount50000(Date from, Date to);
	
	@Query(
			value="Select sum(c.CHARGE_AMOUNT) From coupon_purchase c where c.USER_ID=?1 and c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalAmountPurchase_UserId(Integer userid);
	
	
	@Query(
			value="Select count(c._id) From coupon_purchase c where  c.TOTAL_FEE = 3000 and c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCount3000();
	
	@Query(
			value="Select count(c._id) From coupon_purchase c where c.TOTAL_FEE = 5000 and c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCount5000();
	
	@Query(
			value="Select count(c._id) From coupon_purchase c where  c.TOTAL_FEE = 10000 and c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCount10000();
	
	@Query(
			value="Select count(c._id) From coupon_purchase c where  c.TOTAL_FEE = 30000 and c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCount30000();
	
	@Query(
			value="Select count(c._id) From coupon_purchase c where  c.TOTAL_FEE = 50000 and c.IS_DELETE = 0 and c.STATUS=1",nativeQuery = true
			)
	Integer totalCount50000();
	
}
