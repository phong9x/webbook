package org.trams.webbook.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.trams.webbook.bean.jpa.ProfitRefundEntity;

/**
 * Repository : ProfitRefund.
 */
public interface ProfitRefundJpaRepository extends PagingAndSortingRepository<ProfitRefundEntity, Integer> {
	@Query(
			"Select u From ProfitRefundEntity u where  u.isDelete = 0"
			)
	Page<ProfitRefundEntity> listPaging(Pageable pageable);
	
	@Query(
			"Select u From ProfitRefundEntity u where u.user.id=?1 and u.deposited=1"
			)
	Page<ProfitRefundEntity> listPagingBy_UserId(Integer userid, Pageable pageable);
	
	@Query(
			value="Select sum(c.DEPOSIT_AMOUNT) From profit_refund c where c.USER_ID=?1 and c.IS_DELETE = 0 and c.DEPOSITED=1",nativeQuery = true
			)
	Integer totalRefundBy_UserId(Integer userid);
	
	@Query(
			"Select u From ProfitRefundEntity u where u.user.username like ?1 and u.user.fullname like ?2 and YEAR(u.applicationDate) = ?3 and MONTH(u.applicationDate) = ?4 and u.isDelete = 0"
			)
	Page<ProfitRefundEntity> listPagingProfitRefund(String id, String name, Integer year, Integer month, Pageable pageable);
	
	
	
}
